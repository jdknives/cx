%{

//TODO Put your favorite license here
		
// yacc source generated by ebnf2y[1]
// at 2013-07-20 22:55:50.623909829 +0200 CEST.
//
// CAUTION: If this file is a Go source file (*.go), it was generated
// automatically by '$ go tool yacc' from a *.y file - DO NOT EDIT in that case!
// 
//   [1]: http://modernc.org/ebnf2y

package main //TODO real package name

//TODO required only be the demo _dump function
import (
	"bytes"
	"fmt"
	"strings"

	"github.com/skycoin/cx/goyacc/strutil"
)

%}

%union {
	item interface{} //TODO insert real field(s)
}

%token	ASSIGN_OP
%token	BINARY_OP
%token	FLOAT_LIT
%token	IDENTIFIER
%token	IMAGINARY_LIT
%token	INT_LIT
%token	RUNE_LIT
%token	STRING_LIT
%token	UNARY_OP

%type	<item> 	/*TODO real type(s), if/where applicable */
	ASSIGN_OP
	BINARY_OP
	FLOAT_LIT
	IDENTIFIER
	IMAGINARY_LIT
	INT_LIT
	RUNE_LIT
	STRING_LIT
	UNARY_OP

%token	TOK1	/*TODO Name for "<-" */
%token	TOK2	/*TODO Name for ":=" */
%token	TOK3	/*TODO Name for "++" */
%token	TOK4	/*TODO Name for "--" */
%token	TOK5	/*TODO Name for "..." */

%type	<item> 	/*TODO real type(s), if/where applicable */
	TOK1
	TOK2
	TOK3
	TOK4
	TOK5

%token BREAK
%token CASE
%token CHAN
%token CONST
%token CONTINUE
%token DEFAULT
%token DEFER
%token ELSE
%token FALLTHROUGH
%token FOR
%token FUNC
%token GO
%token GOTO
%token IF
%token IMPORT
%token INTERFACE
%token MAP
%token PACKAGE
%token RANGE
%token RETURN
%token SELECT
%token STRUCT
%token SWITCH
%token TYPE
%token VAR

%type	<item> 	/*TODO real type(s), if/where applicable */
	AnonymousField
	AnonymousField1
	ArgumentList
	ArgumentList1
	ArrayLength
	ArrayType
	Assignment
	BaseType
	BaseTypeName
	BasicLit
	Block
	BreakStmt
	BreakStmt1
	BuiltinArgs
	BuiltinArgs1
	BuiltinCall
	BuiltinCall1
	BuiltinCall11
	Call
	Call1
	Call11
	Channel
	ChannelType
	ChannelType1
	ChannelType11
	CommCase
	CommCase1
	CommClause
	CompositeLit
	Condition
	ConstDecl
	ConstDecl1
	ConstDecl11
	ConstSpec
	ConstSpec1
	ConstSpec11
	ContinueStmt
	ContinueStmt1
	Conversion
	Conversion1
	Declaration
	DeferStmt
	Element
	Element1
	ElementIndex
	ElementList
	ElementList1
	ElementType
	EmptyStmt
	ExprCaseClause
	ExprSwitchCase
	ExprSwitchStmt
	ExprSwitchStmt1
	ExprSwitchStmt2
	ExprSwitchStmt3
	Expression
	ExpressionList
	ExpressionList1
	ExpressionStmt
	FallthroughStmt
	FieldDecl
	FieldDecl1
	FieldDecl2
	FieldName
	ForClause
	ForClause1
	ForClause2
	ForClause3
	ForStmt
	ForStmt1
	ForStmt11
	Function
	FunctionBody
	FunctionDecl
	FunctionDecl1
	FunctionLit
	FunctionName
	FunctionType
	GoStmt
	GotoStmt
	IdentifierList
	IdentifierList1
	IfStmt
	IfStmt1
	IfStmt2
	IfStmt21
	ImportDecl
	ImportDecl1
	ImportDecl11
	ImportPath
	ImportSpec
	ImportSpec1
	ImportSpec11
	IncDecStmt
	IncDecStmt1
	Index
	InitStmt
	InterfaceType
	InterfaceType1
	InterfaceTypeName
	Key
	KeyType
	Label
	LabeledStmt
	Literal
	LiteralType
	LiteralValue
	LiteralValue1
	LiteralValue11
	MapType
	MethodDecl
	MethodDecl1
	MethodExpr
	MethodName
	MethodSpec
	Operand
	OperandName
	PackageClause
	PackageName
	ParameterDecl
	ParameterDecl1
	ParameterDecl2
	ParameterList
	ParameterList1
	Parameters
	Parameters1
	Parameters11
	PointerType
	PostStmt
	PrimaryExpr
	QualifiedIdent
	RangeClause
	RangeClause1
	Receiver
	Receiver1
	Receiver2
	ReceiverType
	RecvExpr
	RecvStmt
	RecvStmt1
	RecvStmt11
	Result
	ReturnStmt
	ReturnStmt1
	SelectStmt
	SelectStmt1
	Selector
	SendStmt
	ShortVarDecl
	Signature
	Signature1
	SimpleStmt
	Slice
	Slice1
	Slice2
	SliceType
	SourceFile
	SourceFile1
	SourceFile2
	Start
	Statement
	StatementList
	StatementList1
	StructType
	StructType1
	SwitchStmt
	Tag
	TopLevelDecl
	Type
	TypeAssertion
	TypeCaseClause
	TypeDecl
	TypeDecl1
	TypeDecl11
	TypeList
	TypeList1
	TypeLit
	TypeName
	TypeSpec
	TypeSwitchCase
	TypeSwitchGuard
	TypeSwitchGuard1
	TypeSwitchStmt
	TypeSwitchStmt1
	TypeSwitchStmt2
	UnaryExpr
	Value
	VarDecl
	VarDecl1
	VarDecl11
	VarSpec
	VarSpec1
	VarSpec11

/*TODO %left, %right, ... declarations */

%start Start

%%

AnonymousField:
	AnonymousField1 TypeName
	{
		$$ = []AnonymousField{$1, $2} //TODO 1
	}

AnonymousField1:
	/* EMPTY */
	{
		$$ = nil //TODO 2
	}
|	'*'
	{
		$$ = "*" //TODO 3
	}

ArgumentList:
	ExpressionList ArgumentList1
	{
		$$ = []ArgumentList{$1, $2} //TODO 4
	}

ArgumentList1:
	/* EMPTY */
	{
		$$ = nil //TODO 5
	}
|	TOK5 /* "..." */
	{
		$$ = "..." //TODO 6
	}

ArrayLength:
	Expression
	{
		$$ = $1 //TODO 7
	}

ArrayType:
	'[' ArrayLength ']' ElementType
	{
		$$ = []ArrayType{"[", $2, "]", $4} //TODO 8
	}

Assignment:
	ExpressionList ASSIGN_OP ExpressionList
	{
		$$ = []Assignment{$1, $2, $3} //TODO 9
	}

BaseType:
	Type
	{
		$$ = $1 //TODO 10
	}

BaseTypeName:
	IDENTIFIER
	{
		$$ = $1 //TODO 11
	}

BasicLit:
	INT_LIT
	{
		$$ = $1 //TODO 12
	}
|	FLOAT_LIT
	{
		$$ = $1 //TODO 13
	}
|	IMAGINARY_LIT
	{
		$$ = $1 //TODO 14
	}
|	RUNE_LIT
	{
		$$ = $1 //TODO 15
	}
|	STRING_LIT
	{
		$$ = $1 //TODO 16
	}

Block:
	'{' StatementList '}'
	{
		$$ = []Block{"{", $2, "}"} //TODO 17
	}

BreakStmt:
	BREAK BreakStmt1
	{
		$$ = []BreakStmt{"break", $2} //TODO 18
	}

BreakStmt1:
	/* EMPTY */
	{
		$$ = nil //TODO 19
	}
|	Label
	{
		$$ = $1 //TODO 20
	}

BuiltinArgs:
	Type BuiltinArgs1
	{
		$$ = []BuiltinArgs{$1, $2} //TODO 21
	}
|	ArgumentList
	{
		$$ = $1 //TODO 22
	}

BuiltinArgs1:
	/* EMPTY */
	{
		$$ = nil //TODO 23
	}
|	',' ArgumentList
	{
		$$ = []BuiltinArgs1{",", $2} //TODO 24
	}

BuiltinCall:
	IDENTIFIER '(' BuiltinCall1 ')'
	{
		$$ = []BuiltinCall{$1, "(", $3, ")"} //TODO 25
	}

BuiltinCall1:
	/* EMPTY */
	{
		$$ = nil //TODO 26
	}
|	BuiltinArgs BuiltinCall11
	{
		$$ = []BuiltinCall1{$1, $2} //TODO 27
	}

BuiltinCall11:
	/* EMPTY */
	{
		$$ = nil //TODO 28
	}
|	','
	{
		$$ = "," //TODO 29
	}

Call:
	'(' Call1 ')'
	{
		$$ = []Call{"(", $2, ")"} //TODO 30
	}

Call1:
	/* EMPTY */
	{
		$$ = nil //TODO 31
	}
|	ArgumentList Call11
	{
		$$ = []Call1{$1, $2} //TODO 32
	}

Call11:
	/* EMPTY */
	{
		$$ = nil //TODO 33
	}
|	','
	{
		$$ = "," //TODO 34
	}

Channel:
	Expression
	{
		$$ = $1 //TODO 35
	}

ChannelType:
	ChannelType1 ElementType
	{
		$$ = []ChannelType{$1, $2} //TODO 36
	}

ChannelType1:
	CHAN ChannelType11
	{
		$$ = []ChannelType1{"chan", $2} //TODO 37
	}
|	TOK1 /* "<-" */ CHAN
	{
		$$ = []ChannelType1{"<-", "chan"} //TODO 38
	}

ChannelType11:
	/* EMPTY */
	{
		$$ = nil //TODO 39
	}
|	TOK1 /* "<-" */
	{
		$$ = "<-" //TODO 40
	}

CommCase:
	CASE CommCase1
	{
		$$ = []CommCase{"case", $2} //TODO 41
	}
|	DEFAULT
	{
		$$ = "default" //TODO 42
	}

CommCase1:
	SendStmt
	{
		$$ = $1 //TODO 43
	}
|	RecvStmt
	{
		$$ = $1 //TODO 44
	}

CommClause:
	CommCase ':' StatementList
	{
		$$ = []CommClause{$1, ":", $3} //TODO 45
	}

CompositeLit:
	LiteralType LiteralValue
	{
		$$ = []CompositeLit{$1, $2} //TODO 46
	}

Condition:
	Expression
	{
		$$ = $1 //TODO 47
	}

ConstDecl:
	CONST ConstDecl1
	{
		$$ = []ConstDecl{"const", $2} //TODO 48
	}

ConstDecl1:
	ConstSpec
	{
		$$ = $1 //TODO 49
	}
|	'(' ConstDecl11 ')'
	{
		$$ = []ConstDecl1{"(", $2, ")"} //TODO 50
	}

ConstDecl11:
	/* EMPTY */
	{
		$$ = []ConstDecl11(nil) //TODO 51
	}
|	ConstDecl11 ConstSpec ';'
	{
		$$ = append($1.([]ConstDecl11), $2, ";") //TODO 52
	}

ConstSpec:
	IdentifierList ConstSpec1
	{
		$$ = []ConstSpec{$1, $2} //TODO 53
	}

ConstSpec1:
	/* EMPTY */
	{
		$$ = nil //TODO 54
	}
|	ConstSpec11 '=' ExpressionList
	{
		$$ = []ConstSpec1{$1, "=", $3} //TODO 55
	}

ConstSpec11:
	/* EMPTY */
	{
		$$ = nil //TODO 56
	}
|	Type
	{
		$$ = $1 //TODO 57
	}

ContinueStmt:
	CONTINUE ContinueStmt1
	{
		$$ = []ContinueStmt{"continue", $2} //TODO 58
	}

ContinueStmt1:
	/* EMPTY */
	{
		$$ = nil //TODO 59
	}
|	Label
	{
		$$ = $1 //TODO 60
	}

Conversion:
	Type '(' Expression Conversion1 ')'
	{
		$$ = []Conversion{$1, "(", $3, $4, ")"} //TODO 61
	}

Conversion1:
	/* EMPTY */
	{
		$$ = nil //TODO 62
	}
|	','
	{
		$$ = "," //TODO 63
	}

Declaration:
	ConstDecl
	{
		$$ = $1 //TODO 64
	}
|	TypeDecl
	{
		$$ = $1 //TODO 65
	}
|	VarDecl
	{
		$$ = $1 //TODO 66
	}

DeferStmt:
	DEFER Expression
	{
		$$ = []DeferStmt{"defer", $2} //TODO 67
	}

Element:
	Element1 Value
	{
		$$ = []Element{$1, $2} //TODO 68
	}

Element1:
	/* EMPTY */
	{
		$$ = nil //TODO 69
	}
|	Key ':'
	{
		$$ = []Element1{$1, ":"} //TODO 70
	}

ElementIndex:
	Expression
	{
		$$ = $1 //TODO 71
	}

ElementList:
	Element ElementList1
	{
		$$ = []ElementList{$1, $2} //TODO 72
	}

ElementList1:
	/* EMPTY */
	{
		$$ = []ElementList1(nil) //TODO 73
	}
|	ElementList1 ',' Element
	{
		$$ = append($1.([]ElementList1), ",", $3) //TODO 74
	}

ElementType:
	Type
	{
		$$ = $1 //TODO 75
	}

EmptyStmt:
	/* EMPTY */
	{
		$$ = nil //TODO 76
	}

ExprCaseClause:
	ExprSwitchCase ':' StatementList
	{
		$$ = []ExprCaseClause{$1, ":", $3} //TODO 77
	}

ExprSwitchCase:
	CASE ExpressionList
	{
		$$ = []ExprSwitchCase{"case", $2} //TODO 78
	}
|	DEFAULT
	{
		$$ = "default" //TODO 79
	}

ExprSwitchStmt:
	SWITCH ExprSwitchStmt1 ExprSwitchStmt2 '{' ExprSwitchStmt3 '}'
	{
		$$ = []ExprSwitchStmt{"switch", $2, $3, "{", $5, "}"} //TODO 80
	}

ExprSwitchStmt1:
	/* EMPTY */
	{
		$$ = nil //TODO 81
	}
|	SimpleStmt ';'
	{
		$$ = []ExprSwitchStmt1{$1, ";"} //TODO 82
	}

ExprSwitchStmt2:
	/* EMPTY */
	{
		$$ = nil //TODO 83
	}
|	Expression
	{
		$$ = $1 //TODO 84
	}

ExprSwitchStmt3:
	/* EMPTY */
	{
		$$ = []ExprSwitchStmt3(nil) //TODO 85
	}
|	ExprSwitchStmt3 ExprCaseClause
	{
		$$ = append($1.([]ExprSwitchStmt3), $2) //TODO 86
	}

Expression:
	UnaryExpr
	{
		$$ = $1 //TODO 87
	}
|	Expression BINARY_OP UnaryExpr
	{
		$$ = []Expression{$1, $2, $3} //TODO 88
	}

ExpressionList:
	Expression ExpressionList1
	{
		$$ = []ExpressionList{$1, $2} //TODO 89
	}

ExpressionList1:
	/* EMPTY */
	{
		$$ = []ExpressionList1(nil) //TODO 90
	}
|	ExpressionList1 ',' Expression
	{
		$$ = append($1.([]ExpressionList1), ",", $3) //TODO 91
	}

ExpressionStmt:
	Expression
	{
		$$ = $1 //TODO 92
	}

FallthroughStmt:
	FALLTHROUGH
	{
		$$ = "fallthrough" //TODO 93
	}

FieldDecl:
	FieldDecl1 FieldDecl2
	{
		$$ = []FieldDecl{$1, $2} //TODO 94
	}

FieldDecl1:
	IdentifierList Type
	{
		$$ = []FieldDecl1{$1, $2} //TODO 95
	}
|	AnonymousField
	{
		$$ = $1 //TODO 96
	}

FieldDecl2:
	/* EMPTY */
	{
		$$ = nil //TODO 97
	}
|	Tag
	{
		$$ = $1 //TODO 98
	}

FieldName:
	IDENTIFIER
	{
		$$ = $1 //TODO 99
	}

ForClause:
	ForClause1 ';' ForClause2 ';' ForClause3
	{
		$$ = []ForClause{$1, ";", $3, ";", $5} //TODO 100
	}

ForClause1:
	/* EMPTY */
	{
		$$ = nil //TODO 101
	}
|	InitStmt
	{
		$$ = $1 //TODO 102
	}

ForClause2:
	/* EMPTY */
	{
		$$ = nil //TODO 103
	}
|	Condition
	{
		$$ = $1 //TODO 104
	}

ForClause3:
	/* EMPTY */
	{
		$$ = nil //TODO 105
	}
|	PostStmt
	{
		$$ = $1 //TODO 106
	}

ForStmt:
	FOR ForStmt1 Block
	{
		$$ = []ForStmt{"for", $2, $3} //TODO 107
	}

ForStmt1:
	/* EMPTY */
	{
		$$ = nil //TODO 108
	}
|	ForStmt11
	{
		$$ = $1 //TODO 109
	}

ForStmt11:
	Condition
	{
		$$ = $1 //TODO 110
	}
|	ForClause
	{
		$$ = $1 //TODO 111
	}
|	RangeClause
	{
		$$ = $1 //TODO 112
	}

Function:
	Signature FunctionBody
	{
		$$ = []Function{$1, $2} //TODO 113
	}

FunctionBody:
	Block
	{
		$$ = $1 //TODO 114
	}

FunctionDecl:
	FUNC FunctionName FunctionDecl1
	{
		$$ = []FunctionDecl{"func", $2, $3} //TODO 115
	}

FunctionDecl1:
	Function
	{
		$$ = $1 //TODO 116
	}
|	Signature
	{
		$$ = $1 //TODO 117
	}

FunctionLit:
	FUNC Function
	{
		$$ = []FunctionLit{"func", $2} //TODO 118
	}

FunctionName:
	IDENTIFIER
	{
		$$ = $1 //TODO 119
	}

FunctionType:
	FUNC Signature
	{
		$$ = []FunctionType{"func", $2} //TODO 120
	}

GoStmt:
	GO Expression
	{
		$$ = []GoStmt{"go", $2} //TODO 121
	}

GotoStmt:
	GOTO Label
	{
		$$ = []GotoStmt{"goto", $2} //TODO 122
	}

IdentifierList:
	IDENTIFIER IdentifierList1
	{
		$$ = []IdentifierList{$1, $2} //TODO 123
	}

IdentifierList1:
	/* EMPTY */
	{
		$$ = []IdentifierList1(nil) //TODO 124
	}
|	IdentifierList1 ',' IDENTIFIER
	{
		$$ = append($1.([]IdentifierList1), ",", $3) //TODO 125
	}

IfStmt:
	IF IfStmt1 Expression Block IfStmt2
	{
		$$ = []IfStmt{"if", $2, $3, $4, $5} //TODO 126
	}

IfStmt1:
	/* EMPTY */
	{
		$$ = nil //TODO 127
	}
|	SimpleStmt ';'
	{
		$$ = []IfStmt1{$1, ";"} //TODO 128
	}

IfStmt2:
	/* EMPTY */
	{
		$$ = nil //TODO 129
	}
|	ELSE IfStmt21
	{
		$$ = []IfStmt2{"else", $2} //TODO 130
	}

IfStmt21:
	IfStmt
	{
		$$ = $1 //TODO 131
	}
|	Block
	{
		$$ = $1 //TODO 132
	}

ImportDecl:
	IMPORT ImportDecl1
	{
		$$ = []ImportDecl{"import", $2} //TODO 133
	}

ImportDecl1:
	ImportSpec
	{
		$$ = $1 //TODO 134
	}
|	'(' ImportDecl11 ')'
	{
		$$ = []ImportDecl1{"(", $2, ")"} //TODO 135
	}

ImportDecl11:
	/* EMPTY */
	{
		$$ = []ImportDecl11(nil) //TODO 136
	}
|	ImportDecl11 ImportSpec ';'
	{
		$$ = append($1.([]ImportDecl11), $2, ";") //TODO 137
	}

ImportPath:
	STRING_LIT
	{
		$$ = $1 //TODO 138
	}

ImportSpec:
	ImportSpec1 ImportPath
	{
		$$ = []ImportSpec{$1, $2} //TODO 139
	}

ImportSpec1:
	/* EMPTY */
	{
		$$ = nil //TODO 140
	}
|	ImportSpec11
	{
		$$ = $1 //TODO 141
	}

ImportSpec11:
	'.'
	{
		$$ = "." //TODO 142
	}
|	PackageName
	{
		$$ = $1 //TODO 143
	}

IncDecStmt:
	Expression IncDecStmt1
	{
		$$ = []IncDecStmt{$1, $2} //TODO 144
	}

IncDecStmt1:
	TOK3 /* "++" */
	{
		$$ = "++" //TODO 145
	}
|	TOK4 /* "--" */
	{
		$$ = "--" //TODO 146
	}

Index:
	'[' Expression ']'
	{
		$$ = []Index{"[", $2, "]"} //TODO 147
	}

InitStmt:
	SimpleStmt
	{
		$$ = $1 //TODO 148
	}

InterfaceType:
	INTERFACE '{' InterfaceType1 '}'
	{
		$$ = []InterfaceType{"interface", "{", $3, "}"} //TODO 149
	}

InterfaceType1:
	/* EMPTY */
	{
		$$ = []InterfaceType1(nil) //TODO 150
	}
|	InterfaceType1 MethodSpec ';'
	{
		$$ = append($1.([]InterfaceType1), $2, ";") //TODO 151
	}

InterfaceTypeName:
	TypeName
	{
		$$ = $1 //TODO 152
	}

Key:
	FieldName
	{
		$$ = $1 //TODO 153
	}
|	ElementIndex
	{
		$$ = $1 //TODO 154
	}

KeyType:
	Type
	{
		$$ = $1 //TODO 155
	}

Label:
	IDENTIFIER
	{
		$$ = $1 //TODO 156
	}

LabeledStmt:
	Label ':' Statement
	{
		$$ = []LabeledStmt{$1, ":", $3} //TODO 157
	}

Literal:
	BasicLit
	{
		$$ = $1 //TODO 158
	}
|	CompositeLit
	{
		$$ = $1 //TODO 159
	}
|	FunctionLit
	{
		$$ = $1 //TODO 160
	}

LiteralType:
	StructType
	{
		$$ = $1 //TODO 161
	}
|	ArrayType
	{
		$$ = $1 //TODO 162
	}
|	'[' TOK5 /* "..." */ ']' ElementType
	{
		$$ = []LiteralType{"[", "...", "]", $4} //TODO 163
	}
|	SliceType
	{
		$$ = $1 //TODO 164
	}
|	MapType
	{
		$$ = $1 //TODO 165
	}
|	TypeName
	{
		$$ = $1 //TODO 166
	}

LiteralValue:
	'{' LiteralValue1 '}'
	{
		$$ = []LiteralValue{"{", $2, "}"} //TODO 167
	}

LiteralValue1:
	/* EMPTY */
	{
		$$ = nil //TODO 168
	}
|	ElementList LiteralValue11
	{
		$$ = []LiteralValue1{$1, $2} //TODO 169
	}

LiteralValue11:
	/* EMPTY */
	{
		$$ = nil //TODO 170
	}
|	','
	{
		$$ = "," //TODO 171
	}

MapType:
	MAP '[' KeyType ']' ElementType
	{
		$$ = []MapType{"map", "[", $3, "]", $5} //TODO 172
	}

MethodDecl:
	FUNC Receiver MethodName MethodDecl1
	{
		$$ = []MethodDecl{"func", $2, $3, $4} //TODO 173
	}

MethodDecl1:
	Function
	{
		$$ = $1 //TODO 174
	}
|	Signature
	{
		$$ = $1 //TODO 175
	}

MethodExpr:
	ReceiverType '.' MethodName
	{
		$$ = []MethodExpr{$1, ".", $3} //TODO 176
	}

MethodName:
	IDENTIFIER
	{
		$$ = $1 //TODO 177
	}

MethodSpec:
	MethodName Signature
	{
		$$ = []MethodSpec{$1, $2} //TODO 178
	}
|	InterfaceTypeName
	{
		$$ = $1 //TODO 179
	}

Operand:
	Literal
	{
		$$ = $1 //TODO 180
	}
|	OperandName
	{
		$$ = $1 //TODO 181
	}
|	MethodExpr
	{
		$$ = $1 //TODO 182
	}
|	'(' Expression ')'
	{
		$$ = []Operand{"(", $2, ")"} //TODO 183
	}

OperandName:
	IDENTIFIER
	{
		$$ = $1 //TODO 184
	}
|	QualifiedIdent
	{
		$$ = $1 //TODO 185
	}

PackageClause:
	PACKAGE PackageName
	{
		$$ = []PackageClause{"package", $2} //TODO 186
	}

PackageName:
	IDENTIFIER
	{
		$$ = $1 //TODO 187
	}

ParameterDecl:
	ParameterDecl1 ParameterDecl2 Type
	{
		$$ = []ParameterDecl{$1, $2, $3} //TODO 188
	}

ParameterDecl1:
	/* EMPTY */
	{
		$$ = nil //TODO 189
	}
|	IdentifierList
	{
		$$ = $1 //TODO 190
	}

ParameterDecl2:
	/* EMPTY */
	{
		$$ = nil //TODO 191
	}
|	TOK5 /* "..." */
	{
		$$ = "..." //TODO 192
	}

ParameterList:
	ParameterDecl ParameterList1
	{
		$$ = []ParameterList{$1, $2} //TODO 193
	}

ParameterList1:
	/* EMPTY */
	{
		$$ = []ParameterList1(nil) //TODO 194
	}
|	ParameterList1 ',' ParameterDecl
	{
		$$ = append($1.([]ParameterList1), ",", $3) //TODO 195
	}

Parameters:
	'(' Parameters1 ')'
	{
		$$ = []Parameters{"(", $2, ")"} //TODO 196
	}

Parameters1:
	/* EMPTY */
	{
		$$ = nil //TODO 197
	}
|	ParameterList Parameters11
	{
		$$ = []Parameters1{$1, $2} //TODO 198
	}

Parameters11:
	/* EMPTY */
	{
		$$ = nil //TODO 199
	}
|	','
	{
		$$ = "," //TODO 200
	}

PointerType:
	'*' BaseType
	{
		$$ = []PointerType{"*", $2} //TODO 201
	}

PostStmt:
	SimpleStmt
	{
		$$ = $1 //TODO 202
	}

PrimaryExpr:
	Operand
	{
		$$ = $1 //TODO 203
	}
|	Conversion
	{
		$$ = $1 //TODO 204
	}
|	BuiltinCall
	{
		$$ = $1 //TODO 205
	}
|	PrimaryExpr Selector
	{
		$$ = []PrimaryExpr{$1, $2} //TODO 206
	}
|	PrimaryExpr Index
	{
		$$ = []PrimaryExpr{$1, $2} //TODO 207
	}
|	PrimaryExpr Slice
	{
		$$ = []PrimaryExpr{$1, $2} //TODO 208
	}
|	PrimaryExpr TypeAssertion
	{
		$$ = []PrimaryExpr{$1, $2} //TODO 209
	}
|	PrimaryExpr Call
	{
		$$ = []PrimaryExpr{$1, $2} //TODO 210
	}

QualifiedIdent:
	PackageName '.' IDENTIFIER
	{
		$$ = []QualifiedIdent{$1, ".", $3} //TODO 211
	}

RangeClause:
	RangeClause1 RANGE Expression
	{
		$$ = []RangeClause{$1, "range", $3} //TODO 212
	}

RangeClause1:
	ExpressionList '='
	{
		$$ = []RangeClause1{$1, "="} //TODO 213
	}
|	IdentifierList TOK2 /* ":=" */
	{
		$$ = []RangeClause1{$1, ":="} //TODO 214
	}

Receiver:
	'(' Receiver1 Receiver2 BaseTypeName ')'
	{
		$$ = []Receiver{"(", $2, $3, $4, ")"} //TODO 215
	}

Receiver1:
	/* EMPTY */
	{
		$$ = nil //TODO 216
	}
|	IDENTIFIER
	{
		$$ = $1 //TODO 217
	}

Receiver2:
	/* EMPTY */
	{
		$$ = nil //TODO 218
	}
|	'*'
	{
		$$ = "*" //TODO 219
	}

ReceiverType:
	TypeName
	{
		$$ = $1 //TODO 220
	}
|	'(' '*' TypeName ')'
	{
		$$ = []ReceiverType{"(", "*", $3, ")"} //TODO 221
	}
|	'(' ReceiverType ')'
	{
		$$ = []ReceiverType{"(", $2, ")"} //TODO 222
	}

RecvExpr:
	Expression
	{
		$$ = $1 //TODO 223
	}

RecvStmt:
	RecvStmt1 RecvExpr
	{
		$$ = []RecvStmt{$1, $2} //TODO 224
	}

RecvStmt1:
	/* EMPTY */
	{
		$$ = nil //TODO 225
	}
|	RecvStmt11
	{
		$$ = $1 //TODO 226
	}

RecvStmt11:
	ExpressionList '='
	{
		$$ = []RecvStmt11{$1, "="} //TODO 227
	}
|	IdentifierList TOK2 /* ":=" */
	{
		$$ = []RecvStmt11{$1, ":="} //TODO 228
	}

Result:
	Parameters
	{
		$$ = $1 //TODO 229
	}
|	Type
	{
		$$ = $1 //TODO 230
	}

ReturnStmt:
	RETURN ReturnStmt1
	{
		$$ = []ReturnStmt{"return", $2} //TODO 231
	}

ReturnStmt1:
	/* EMPTY */
	{
		$$ = nil //TODO 232
	}
|	ExpressionList
	{
		$$ = $1 //TODO 233
	}

SelectStmt:
	SELECT '{' SelectStmt1 '}'
	{
		$$ = []SelectStmt{"select", "{", $3, "}"} //TODO 234
	}

SelectStmt1:
	/* EMPTY */
	{
		$$ = []SelectStmt1(nil) //TODO 235
	}
|	SelectStmt1 CommClause
	{
		$$ = append($1.([]SelectStmt1), $2) //TODO 236
	}

Selector:
	'.' IDENTIFIER
	{
		$$ = []Selector{".", $2} //TODO 237
	}

SendStmt:
	Channel TOK1 /* "<-" */ Expression
	{
		$$ = []SendStmt{$1, "<-", $3} //TODO 238
	}

ShortVarDecl:
	IdentifierList TOK2 /* ":=" */ ExpressionList
	{
		$$ = []ShortVarDecl{$1, ":=", $3} //TODO 239
	}

Signature:
	Parameters Signature1
	{
		$$ = []Signature{$1, $2} //TODO 240
	}

Signature1:
	/* EMPTY */
	{
		$$ = nil //TODO 241
	}
|	Result
	{
		$$ = $1 //TODO 242
	}

SimpleStmt:
	EmptyStmt
	{
		$$ = $1 //TODO 243
	}
|	ExpressionStmt
	{
		$$ = $1 //TODO 244
	}
|	SendStmt
	{
		$$ = $1 //TODO 245
	}
|	IncDecStmt
	{
		$$ = $1 //TODO 246
	}
|	Assignment
	{
		$$ = $1 //TODO 247
	}
|	ShortVarDecl
	{
		$$ = $1 //TODO 248
	}

Slice:
	'[' Slice1 ':' Slice2 ']'
	{
		$$ = []Slice{"[", $2, ":", $4, "]"} //TODO 249
	}

Slice1:
	/* EMPTY */
	{
		$$ = nil //TODO 250
	}
|	Expression
	{
		$$ = $1 //TODO 251
	}

Slice2:
	/* EMPTY */
	{
		$$ = nil //TODO 252
	}
|	Expression
	{
		$$ = $1 //TODO 253
	}

SliceType:
	'[' ']' ElementType
	{
		$$ = []SliceType{"[", "]", $3} //TODO 254
	}

SourceFile:
	PackageClause ';' SourceFile1 SourceFile2
	{
		$$ = []SourceFile{$1, ";", $3, $4} //TODO 255
	}

SourceFile1:
	/* EMPTY */
	{
		$$ = []SourceFile1(nil) //TODO 256
	}
|	SourceFile1 ImportDecl ';'
	{
		$$ = append($1.([]SourceFile1), $2, ";") //TODO 257
	}

SourceFile2:
	/* EMPTY */
	{
		$$ = []SourceFile2(nil) //TODO 258
	}
|	SourceFile2 TopLevelDecl ';'
	{
		$$ = append($1.([]SourceFile2), $2, ";") //TODO 259
	}

Start:
	SourceFile
	{
		_parserResult = $1 //TODO 260
	}

Statement:
	Declaration
	{
		$$ = $1 //TODO 261
	}
|	LabeledStmt
	{
		$$ = $1 //TODO 262
	}
|	SimpleStmt
	{
		$$ = $1 //TODO 263
	}
|	GoStmt
	{
		$$ = $1 //TODO 264
	}
|	ReturnStmt
	{
		$$ = $1 //TODO 265
	}
|	BreakStmt
	{
		$$ = $1 //TODO 266
	}
|	ContinueStmt
	{
		$$ = $1 //TODO 267
	}
|	GotoStmt
	{
		$$ = $1 //TODO 268
	}
|	FallthroughStmt
	{
		$$ = $1 //TODO 269
	}
|	Block
	{
		$$ = $1 //TODO 270
	}
|	IfStmt
	{
		$$ = $1 //TODO 271
	}
|	SwitchStmt
	{
		$$ = $1 //TODO 272
	}
|	SelectStmt
	{
		$$ = $1 //TODO 273
	}
|	ForStmt
	{
		$$ = $1 //TODO 274
	}
|	DeferStmt
	{
		$$ = $1 //TODO 275
	}

StatementList:
	StatementList1
	{
		$$ = $1 //TODO 276
	}

StatementList1:
	/* EMPTY */
	{
		$$ = []StatementList1(nil) //TODO 277
	}
|	StatementList1 Statement ';'
	{
		$$ = append($1.([]StatementList1), $2, ";") //TODO 278
	}

StructType:
	STRUCT '{' StructType1 '}'
	{
		$$ = []StructType{"struct", "{", $3, "}"} //TODO 279
	}

StructType1:
	/* EMPTY */
	{
		$$ = []StructType1(nil) //TODO 280
	}
|	StructType1 FieldDecl ';'
	{
		$$ = append($1.([]StructType1), $2, ";") //TODO 281
	}

SwitchStmt:
	ExprSwitchStmt
	{
		$$ = $1 //TODO 282
	}
|	TypeSwitchStmt
	{
		$$ = $1 //TODO 283
	}

Tag:
	STRING_LIT
	{
		$$ = $1 //TODO 284
	}

TopLevelDecl:
	Declaration
	{
		$$ = $1 //TODO 285
	}
|	FunctionDecl
	{
		$$ = $1 //TODO 286
	}
|	MethodDecl
	{
		$$ = $1 //TODO 287
	}

Type:
	TypeName
	{
		$$ = $1 //TODO 288
	}
|	TypeLit
	{
		$$ = $1 //TODO 289
	}
|	'(' Type ')'
	{
		$$ = []Type{"(", $2, ")"} //TODO 290
	}

TypeAssertion:
	'.' '(' Type ')'
	{
		$$ = []TypeAssertion{".", "(", $3, ")"} //TODO 291
	}

TypeCaseClause:
	TypeSwitchCase ':' StatementList
	{
		$$ = []TypeCaseClause{$1, ":", $3} //TODO 292
	}

TypeDecl:
	TYPE TypeDecl1
	{
		$$ = []TypeDecl{"type", $2} //TODO 293
	}

TypeDecl1:
	TypeSpec
	{
		$$ = $1 //TODO 294
	}
|	'(' TypeDecl11 ')'
	{
		$$ = []TypeDecl1{"(", $2, ")"} //TODO 295
	}

TypeDecl11:
	/* EMPTY */
	{
		$$ = []TypeDecl11(nil) //TODO 296
	}
|	TypeDecl11 TypeSpec ';'
	{
		$$ = append($1.([]TypeDecl11), $2, ";") //TODO 297
	}

TypeList:
	Type TypeList1
	{
		$$ = []TypeList{$1, $2} //TODO 298
	}

TypeList1:
	/* EMPTY */
	{
		$$ = []TypeList1(nil) //TODO 299
	}
|	TypeList1 ',' Type
	{
		$$ = append($1.([]TypeList1), ",", $3) //TODO 300
	}

TypeLit:
	ArrayType
	{
		$$ = $1 //TODO 301
	}
|	StructType
	{
		$$ = $1 //TODO 302
	}
|	PointerType
	{
		$$ = $1 //TODO 303
	}
|	FunctionType
	{
		$$ = $1 //TODO 304
	}
|	InterfaceType
	{
		$$ = $1 //TODO 305
	}
|	SliceType
	{
		$$ = $1 //TODO 306
	}
|	MapType
	{
		$$ = $1 //TODO 307
	}
|	ChannelType
	{
		$$ = $1 //TODO 308
	}

TypeName:
	IDENTIFIER
	{
		$$ = $1 //TODO 309
	}
|	QualifiedIdent
	{
		$$ = $1 //TODO 310
	}

TypeSpec:
	IDENTIFIER Type
	{
		$$ = []TypeSpec{$1, $2} //TODO 311
	}

TypeSwitchCase:
	CASE TypeList
	{
		$$ = []TypeSwitchCase{"case", $2} //TODO 312
	}
|	DEFAULT
	{
		$$ = "default" //TODO 313
	}

TypeSwitchGuard:
	TypeSwitchGuard1 PrimaryExpr '.' '(' TYPE ')'
	{
		$$ = []TypeSwitchGuard{$1, $2, ".", "(", "type", ")"} //TODO 314
	}

TypeSwitchGuard1:
	/* EMPTY */
	{
		$$ = nil //TODO 315
	}
|	IDENTIFIER TOK2 /* ":=" */
	{
		$$ = []TypeSwitchGuard1{$1, ":="} //TODO 316
	}

TypeSwitchStmt:
	SWITCH TypeSwitchStmt1 TypeSwitchGuard '{' TypeSwitchStmt2 '}'
	{
		$$ = []TypeSwitchStmt{"switch", $2, $3, "{", $5, "}"} //TODO 317
	}

TypeSwitchStmt1:
	/* EMPTY */
	{
		$$ = nil //TODO 318
	}
|	SimpleStmt ';'
	{
		$$ = []TypeSwitchStmt1{$1, ";"} //TODO 319
	}

TypeSwitchStmt2:
	/* EMPTY */
	{
		$$ = []TypeSwitchStmt2(nil) //TODO 320
	}
|	TypeSwitchStmt2 TypeCaseClause
	{
		$$ = append($1.([]TypeSwitchStmt2), $2) //TODO 321
	}

UnaryExpr:
	PrimaryExpr
	{
		$$ = $1 //TODO 322
	}
|	UNARY_OP UnaryExpr
	{
		$$ = []UnaryExpr{$1, $2} //TODO 323
	}

Value:
	Expression
	{
		$$ = $1 //TODO 324
	}
|	LiteralValue
	{
		$$ = $1 //TODO 325
	}

VarDecl:
	VAR VarDecl1
	{
		$$ = []VarDecl{"var", $2} //TODO 326
	}

VarDecl1:
	VarSpec
	{
		$$ = $1 //TODO 327
	}
|	'(' VarDecl11 ')'
	{
		$$ = []VarDecl1{"(", $2, ")"} //TODO 328
	}

VarDecl11:
	/* EMPTY */
	{
		$$ = []VarDecl11(nil) //TODO 329
	}
|	VarDecl11 VarSpec ';'
	{
		$$ = append($1.([]VarDecl11), $2, ";") //TODO 330
	}

VarSpec:
	IdentifierList VarSpec1
	{
		$$ = []VarSpec{$1, $2} //TODO 331
	}

VarSpec1:
	Type VarSpec11
	{
		$$ = []VarSpec1{$1, $2} //TODO 332
	}
|	'=' ExpressionList
	{
		$$ = []VarSpec1{"=", $2} //TODO 333
	}

VarSpec11:
	/* EMPTY */
	{
		$$ = nil //TODO 334
	}
|	'=' ExpressionList
	{
		$$ = []VarSpec11{"=", $2} //TODO 335
	}

%%

//TODO remove demo stuff below

var _parserResult interface{}

type (
	AnonymousField interface{}
	AnonymousField1 interface{}
	ArgumentList interface{}
	ArgumentList1 interface{}
	ArrayLength interface{}
	ArrayType interface{}
	Assignment interface{}
	BaseType interface{}
	BaseTypeName interface{}
	BasicLit interface{}
	Block interface{}
	BreakStmt interface{}
	BreakStmt1 interface{}
	BuiltinArgs interface{}
	BuiltinArgs1 interface{}
	BuiltinCall interface{}
	BuiltinCall1 interface{}
	BuiltinCall11 interface{}
	Call interface{}
	Call1 interface{}
	Call11 interface{}
	Channel interface{}
	ChannelType interface{}
	ChannelType1 interface{}
	ChannelType11 interface{}
	CommCase interface{}
	CommCase1 interface{}
	CommClause interface{}
	CompositeLit interface{}
	Condition interface{}
	ConstDecl interface{}
	ConstDecl1 interface{}
	ConstDecl11 interface{}
	ConstSpec interface{}
	ConstSpec1 interface{}
	ConstSpec11 interface{}
	ContinueStmt interface{}
	ContinueStmt1 interface{}
	Conversion interface{}
	Conversion1 interface{}
	Declaration interface{}
	DeferStmt interface{}
	Element interface{}
	Element1 interface{}
	ElementIndex interface{}
	ElementList interface{}
	ElementList1 interface{}
	ElementType interface{}
	EmptyStmt interface{}
	ExprCaseClause interface{}
	ExprSwitchCase interface{}
	ExprSwitchStmt interface{}
	ExprSwitchStmt1 interface{}
	ExprSwitchStmt2 interface{}
	ExprSwitchStmt3 interface{}
	Expression interface{}
	ExpressionList interface{}
	ExpressionList1 interface{}
	ExpressionStmt interface{}
	FallthroughStmt interface{}
	FieldDecl interface{}
	FieldDecl1 interface{}
	FieldDecl2 interface{}
	FieldName interface{}
	ForClause interface{}
	ForClause1 interface{}
	ForClause2 interface{}
	ForClause3 interface{}
	ForStmt interface{}
	ForStmt1 interface{}
	ForStmt11 interface{}
	Function interface{}
	FunctionBody interface{}
	FunctionDecl interface{}
	FunctionDecl1 interface{}
	FunctionLit interface{}
	FunctionName interface{}
	FunctionType interface{}
	GoStmt interface{}
	GotoStmt interface{}
	IdentifierList interface{}
	IdentifierList1 interface{}
	IfStmt interface{}
	IfStmt1 interface{}
	IfStmt2 interface{}
	IfStmt21 interface{}
	ImportDecl interface{}
	ImportDecl1 interface{}
	ImportDecl11 interface{}
	ImportPath interface{}
	ImportSpec interface{}
	ImportSpec1 interface{}
	ImportSpec11 interface{}
	IncDecStmt interface{}
	IncDecStmt1 interface{}
	Index interface{}
	InitStmt interface{}
	InterfaceType interface{}
	InterfaceType1 interface{}
	InterfaceTypeName interface{}
	Key interface{}
	KeyType interface{}
	Label interface{}
	LabeledStmt interface{}
	Literal interface{}
	LiteralType interface{}
	LiteralValue interface{}
	LiteralValue1 interface{}
	LiteralValue11 interface{}
	MapType interface{}
	MethodDecl interface{}
	MethodDecl1 interface{}
	MethodExpr interface{}
	MethodName interface{}
	MethodSpec interface{}
	Operand interface{}
	OperandName interface{}
	PackageClause interface{}
	PackageName interface{}
	ParameterDecl interface{}
	ParameterDecl1 interface{}
	ParameterDecl2 interface{}
	ParameterList interface{}
	ParameterList1 interface{}
	Parameters interface{}
	Parameters1 interface{}
	Parameters11 interface{}
	PointerType interface{}
	PostStmt interface{}
	PrimaryExpr interface{}
	QualifiedIdent interface{}
	RangeClause interface{}
	RangeClause1 interface{}
	Receiver interface{}
	Receiver1 interface{}
	Receiver2 interface{}
	ReceiverType interface{}
	RecvExpr interface{}
	RecvStmt interface{}
	RecvStmt1 interface{}
	RecvStmt11 interface{}
	Result interface{}
	ReturnStmt interface{}
	ReturnStmt1 interface{}
	SelectStmt interface{}
	SelectStmt1 interface{}
	Selector interface{}
	SendStmt interface{}
	ShortVarDecl interface{}
	Signature interface{}
	Signature1 interface{}
	SimpleStmt interface{}
	Slice interface{}
	Slice1 interface{}
	Slice2 interface{}
	SliceType interface{}
	SourceFile interface{}
	SourceFile1 interface{}
	SourceFile2 interface{}
	Start interface{}
	Statement interface{}
	StatementList interface{}
	StatementList1 interface{}
	StructType interface{}
	StructType1 interface{}
	SwitchStmt interface{}
	Tag interface{}
	TopLevelDecl interface{}
	Type interface{}
	TypeAssertion interface{}
	TypeCaseClause interface{}
	TypeDecl interface{}
	TypeDecl1 interface{}
	TypeDecl11 interface{}
	TypeList interface{}
	TypeList1 interface{}
	TypeLit interface{}
	TypeName interface{}
	TypeSpec interface{}
	TypeSwitchCase interface{}
	TypeSwitchGuard interface{}
	TypeSwitchGuard1 interface{}
	TypeSwitchStmt interface{}
	TypeSwitchStmt1 interface{}
	TypeSwitchStmt2 interface{}
	UnaryExpr interface{}
	Value interface{}
	VarDecl interface{}
	VarDecl1 interface{}
	VarDecl11 interface{}
	VarSpec interface{}
	VarSpec1 interface{}
	VarSpec11 interface{}
)
	
func _dump() {
	s := fmt.Sprintf("%#v", _parserResult)
	s = strings.Replace(s, "%", "%%", -1)
	s = strings.Replace(s, "{", "{%i\n", -1)
	s = strings.Replace(s, "}", "%u\n}", -1)
	s = strings.Replace(s, ", ", ",\n", -1)
	var buf bytes.Buffer
	strutil.IndentFormatter(&buf, ". ").Format(s)
	buf.WriteString("\n")
	a := strings.Split(buf.String(), "\n")
	for _, v := range a {
		if strings.HasSuffix(v, "(nil)") || strings.HasSuffix(v, "(nil),") {
			continue
		}
	
		fmt.Println(v)
	}
}

// End of demo stuff
