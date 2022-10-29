(*Header*)
{
open Parser
}

(*Identifiers*)
let white = [' ' '\t']+

(*Rules*)
rule read =
    parse 
    | white { read lexbuf }
    | "true" { TRUE }
    | "false" { FALSE }
    | "(" { LPAREN }
    | ")" { RPAREN }
    | "if" { IF }
    | "then" { THEN }
    | "else" { ELSE }
    | "not" { NOT }
    | "and" { AND }
    | "or" { OR }
    | eof { EOF }
