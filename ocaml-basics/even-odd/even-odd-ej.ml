let is_even a = (a mod 2 = 0);;

let win a b = 
  let is_correct n = (n>=1 && n<=5) in
  match (a,b) with
    (a,b) when (is_correct a && not(is_correct b)) -> 1
  | (a,b) when (not(is_correct a) && is_correct b) -> -1
  | (a,b) when (not(is_correct a) && not(is_correct b)) -> 0
  | (a,b) when (is_even(a+b)) -> 1
  | _-> -1;;