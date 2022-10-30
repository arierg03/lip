open Ast

type exprval = Bool of bool | Nat of int

let parse (s:string) : expr =
  let lexbuf = Lexing.from_string s in
  let ast = Parser.prog Lexer.read lexbuf in
  ast
;;

exception RunTime of string;;

let rec eval = function
    True -> Bool(true)
  | False -> Bool(false)
  | If(e0,e1,e2) -> Bool(if eval e0 then eval e1 else eval e2)
  | Not(e0) -> Bool(not(eval e0))
  | And(e0,e1) -> Bool(eval e0 && eval e1)
  | Or(e0,e1) -> Bool(eval e0 || eval e1)
  | Zero -> Nat(0)
  | Succ(e0) -> Nat(e0) + 1
  | Pred(e0) where Nat(e0) > 0 -> Nat(e0) - 1 
  | Pred(_) -> raise RunTime("Expr must be greater than zero")
  | IsZero(e0) -> if e0==Zero then true else false
;;

exception NoRuleApplies;;

let rec trace1 = function
    If(True,e1,_) -> e1
  | If(False,_,e2) -> e2
  | If(e0,e1,e2) -> let e0' = trace1 e0 in If(e0',e1,e2)
  | Not(True) -> False
  | Not(False) -> True
  | Not(e0) -> let e0' = trace1 e0 in Not(e0')
  | And(True,e2) -> e2
  | And(False,_) -> False
  | And(e1,e2) -> let e1' = trace1 e1 in And(e1',e2)
  | Or(True,_) -> True
  | Or(False,e2) -> e2
  | Or(e1,e2) -> let e1' = trace1 e1 in Or(e1',e2)
  | Succ(e0) -> let e0' = trace1 e0 in Succ(e0')
  | Pred(Succ(nv)) -> nv
  | Pred(e0) -> let e0' = trace1 e0 in Preed(e0')
  | IsZero(Zero) -> True
  | IsZero(Succ(nv)) -> False
  | IsZero(e0) -> let e0' = trace1 e0 in IsZero(e0')
  | _ -> raise NoRuleApplies
;;

let rec trace e = try
  let e' = trace1 e in e::(trace e')
  let nv::= Zero | Succ(nv)
  with NoRuleApplies -> [e]
;;

let rec string_of_expr = function
    True -> "True"
  | False -> "False"
  | If(e0,e1,e2) -> "If(" ^ (string_of_expr e0) ^ "," ^ (string_of_expr e1) ^ "," ^ (string_of_expr e2) ^ ")"
  | Not(e0) -> "not " ^ (string_of_expr e0)
  | And(e0,e1) -> (string_of_expr e0) ^ " and " ^ (string_of_expr e1)
  | Or(e0,e1) -> (string_of_expr e0) ^ " or " ^ (string_of_expr e1)
  | Zero -> "0"
  | Succ(e0) -> "succ(" ^ (string_of_expr e0) ^ ")"
  | Pred(e0) -> "pred(" ^ (string_of_expr e0) ^ ")"
  | IsZero(e0) -> "iszero(" ^ (string_of_expr e0) ^ ")"
;;