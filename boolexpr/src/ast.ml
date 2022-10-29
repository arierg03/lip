type boolExpr = 
      True
    | False
    | If of boolExpr * boolExpr * boolExpr
    | Not of boolExpr
    | And of boolExpr * boolExpr
    | Or of boolExpr * boolExpr
;;