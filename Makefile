.DEFAULT_GOAL := help
.PHONY: build-parser build build-full test test-full
.PHONY: install-gfx-deps install-gfx-deps-LINUX install-gfx-deps-MSYS install-gfx-deps-MINGW install-gfx-deps-MACOS install-deps install install-full
.PHONY: vendor

PWD := $(shell pwd)

#PKG_NAMES_LINUX := glade xvfb libxinerama-dev libxcursor-dev libxrandr-dev libgl1-mesa-dev libxi-dev gir1.2-gtk-3.0 libgtk2.0-dev libperl-dev libcairo2-dev libpango1.0-dev libgtk-3-dev gtk+3.0 libglib2.0-dev
PKG_NAMES_LINUX := glade xvfb libxinerama-dev libxcursor-dev libxrandr-dev libgl1-mesa-dev libxi-dev libperl-dev libcairo2-dev libpango1.0-dev libglib2.0-dev libopenal-dev libxxf86vm-dev
#PKG_NAMES_MACOS := gtk gtk-mac-integration gtk+3 glade
PKG_NAMES_WINDOWS := mingw-w64-x86_64-openal

UNAME_S := $(shell uname -s)

CXVERSION := $(shell $(PWD)/bin/cx --version 2> /dev/null)

ifneq (,$(findstring Linux, $(UNAME_S)))
PLATFORM := LINUX
SUBSYSTEM := LINUX
PACKAGES := PGK_NAMES_LINUX
DISPLAY  := :99.0
endif

ifneq (,$(findstring Darwin, $(UNAME_S)))
PLATFORM := MACOS
SUBSYSTEM := MACOS
PACKAGES := PKG_NAMES_MACOS
endif

ifneq (,$(findstring MINGW, $(UNAME_S)))
PLATFORM := WINDOWS
SUBSYSTEM := MINGW
PACKAGES := PKG_NAMES_WINDOWS
endif

#ifneq (,$(findstring CYGWIN, $(UNAME_S)))
#PLATFORM := WINDOWS
#SUBSYSTEM := CYGWIN
#endif

ifneq (,$(findstring MSYS, $(UNAME_S)))
PLATFORM := WINDOWS
SUBSYSTEM := MSYS
PACKAGES := PKG_NAMES_WINDOWS
endif

ifeq ($(PLATFORM), WINDOWS)
GOPATH := $(subst \,/,${GOPATH})
HOME := $(subst \,/,${HOME})
CXPATH := $(subst, \,/, ${CXPATH})
endif

INSTALL_GFX_DEPS := install-gfx-deps-$(SUBSYSTEM)

GLOBAL_GOPATH := $(GOPATH)
LOCAL_GOPATH  := $(HOME)/go

ifdef GLOBAL_GOPATH
  GOPATH := $(GLOBAL_GOPATH)
else
  GOPATH := $(LOCAL_GOPATH)
endif

GOLANGCI_LINT_VERSION ?= latest

GO_OPTS ?= -mod=vendor

ifdef CXPATH
	CX_PATH := $(CXPATH)
else
	CX_PATH := $(HOME)/cx
endif

ifeq ($(UNAME_S), Linux)
endif

configure-workspace: ## Configure CX workspace environment
	mkdir -p $(CX_PATH)/src $(CX_PATH)/bin $(CX_PATH)/pkg
	@echo "NOTE:\tCX workspace at $(CX_PATH)"

build-parser: install-deps ## Generate lexer and parser for CX grammar
	./bin/goyacc -o cxgo/cxgo0/cxgo0.go cxgo/cxgo0/cxgo0.y
	./bin/goyacc -o cxgo/parser/cxgo.go cxgo/parser/cxgo.y

build:  ## Build CX from sources
	go build $(GO_OPTS) -tags="base" -i -o ./bin/cx github.com/skycoin/cx/cxgo/
	chmod +x ./bin/cx

build-full: install-full  ## Build CX from sources with all build tags
	go build $(GO_OPTS) -tags="base cxfx" -i -o ./bin/cx github.com/skycoin/cx/cxgo/
	chmod +x ./bin/cx

build-android: install-full install-mobile 
	# TODO @evanlinjin: We should switch this to use 'github.com/SkycoinProject/gomobile' once it can build.
	go get -u golang.org/x/mobile/cmd/gomobile

install-gfx-deps-LINUX:
	@echo 'Installing dependencies for $(UNAME_S)'
	sudo apt-get update -qq
	sudo apt-get install -y $(PKG_NAMES_LINUX) --no-install-recommends

install-gfx-deps-MSYS:
	@echo 'Installing dependencies for $(UNAME_S)'
	pacman -Sy
	pacman -S $(PKG_NAMES_WINDOWS)
	if [ ! -a /mingw64/lib/libOpenAL32.a]; then ln -s /mingw64/lib/libopenal.a /mingw64/lib/libOpenAL32.a; fi
	if [ ! -a /mingw64/lib/libOpenAL32.dll.a]; then ln -s /mingw64/lib/libopenal.dll.a /mingw64/lib/libOpenAL32.dll.a; fi

install-gfx-deps-MINGW: install-gfx-deps-MSYS

install-gfx-deps-MACOS:
	@echo 'Installing dependencies for $(UNAME_S)'
#brew install $(PKG_NAMES_MACOS)

install-deps:
	@echo "Installing go package dependencies"
	go get -u modernc.org/goyacc

install: install-deps build configure-workspace ## Install CX from sources. Build dependencies
	@echo 'NOTE:\tWe recommend you to test your CX installation by running "cx ./tests"'
	./bin/cx -v

install-full: install-deps configure-workspace

install-mobile:
	go get golang.org/x/mobile/gl # TODO @evanlinjin: This is a library. needed?

clean: ## Removes binaries. 
	rm -rf ./bin

token-fuzzer:
	go build $(GO_OPTS) -i -o ./bin/cx-token-fuzzer $(PWD)/development/token-fuzzer/main.go
	chmod +x ${GOPATH}/bin/cx-token-fuzzer

test: #build ## Run CX test suite.
ifndef CXVERSION
	@echo "cx not found in $(PWD)/bin, please run make install first"
else	
	go test $(GO_OPTS) -race -tags base github.com/skycoin/cx/cxgo/
	./bin/cx ./lib/args.cx ./tests/main.cx ++wdir=./tests ++disable-tests=gui,issue
endif

test-full: build ## Run CX test suite with all build tags
	go test $(GO_OPTS) -race -tags="base cxfx" github.com/skycoin/cx/cxgo/
	./bin/cx ./lib/args.cx ./tests/main.cx ++wdir=./tests ++disable-tests=gui,issue

check: test ## Perform self-tests

format: ## Formats the code. Must have goimports installed (use make install-linters).
	goimports -w -local github.com/skycoin/cx ./cx
	goimports -w -local github.com/skycoin/cx ./cxfx
	goimports -w -local github.com/skycoin/cx ./cxgo

update-vendor: ## Update go vendor
	go mod $(GO_OPTS) vendor
	go mod $(GO_OPTS) verify
	go mod $(GO_OPTS) tidy

help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'
