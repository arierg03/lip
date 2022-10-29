//Header
%{
    open Ast
%}

//Declaratios
%token TRUE
%token FALSE
%token LPAREN //left parentesis
%token RPAREN //rigth parentesis
%token NOT
%token AND
%token OR
%token IF
%token THEN
%token ELSE
%token EOF //end of file

%nonassoc ELSE //no asociative
%left OR //has priority over ELSE
%left AND //has priority over OR
%right NOT //has the highest priority

%start <boolExpr> prog
%%

//Rules
prog:
    | e = expr; EOF { e }
;;

expr:
    | TRUE { True }
    | FALSE { False }
    | NOT; e1 = expr; { Not(e1) }
    | e1 = expr; AND; e2 = expr; { And(e1, e2) }
    | e1 = expr; OR; e2 = expr; { Or(e1, e2) }
    | IF; e1 = expr; THEN; e2 = expr; ELSE; e3 = expr; { If(e1, e2, e3) }
    | LPAREN; e = expr; RPAREN {e}
;;