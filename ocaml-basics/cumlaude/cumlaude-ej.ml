type grade = Val of int | CumLaude;;

let is_valid (x:grade) : bool = match x with
  | (Val x) when (x>=18 && x <=30) -> true
  | CumLaude -> true
  | _ -> false

let int_of_grade (x:grade) : int = match x with
  | x when not(is_valid x) -> failwith "Error: No valid grade"
  | CumLaude -> 32
  | (Val x) -> x

  let avg l = (float_of_int (List.fold_right (+) (List.map int_of_grade l) 0)) /. (float_of_int (List.length l));;