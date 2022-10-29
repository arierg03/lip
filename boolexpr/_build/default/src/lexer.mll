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
    | eof { EOF }
