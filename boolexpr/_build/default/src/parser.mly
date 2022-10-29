//Header
%{
    open Ast
%}

//Declaratios
%token TRUE
%token FALSE
%token LPAREN //left parentesis
%token RPAREN //rigth parentesis
%token IF
%token THEN
%token ELSE
%token EOF //end of file

%start <boolExpr> prog
%%

//Rules
prog:
    | e = expr; EOF { e }
;;

expr:
    | TRUE { True }
    | FALSE { False }
    | IF; e1 = expr; THEN; e2 = expr; ELSE; e3 = expr; { If(e1, e2, e3) }
    | LPAREN; e = expr; RPAREN {e}
;;