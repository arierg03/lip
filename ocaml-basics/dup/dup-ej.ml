let rec recorre x = function
    [] -> false
  | y::l -> x=y || recorre x l
;;

let rec dup = function
    [] -> false
  | x::l -> recorre x l || dup l
;;