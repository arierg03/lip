type expr = 
      True
    | False
    | If of expr * expr * expr
    | Not of expr
    | And of expr * expr
    | Or of expr * expr
    | Zero
    | Succ of expr
    | Pred of expr
    | IsZero of expr
;;