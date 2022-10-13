let rec fib = function
  n when n<0 -> failwith "Error: Number not valid"
  | 0 -> []
  | 1 -> [0]
  | 2 -> [0;1]
  | x -> let l = fib (x-1) in
          match List.rev l with x::y::l' -> l@[x+y]