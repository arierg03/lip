let string_of_list (l:int list):string = 
  let rec aux = function
  | [] -> ""
  | [x] -> string_of_int x
  | x::rest -> string_of_int x ^ ";" ^ aux rest
  in
  "[" ^ aux l ^ "]"
;;