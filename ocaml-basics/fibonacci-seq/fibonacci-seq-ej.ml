let fib x =
  let rec aux acc n2 n1 = function
  | 1 -> acc
  | c -> aux ((n2 + n1) :: acc) n1 (n2 + n1) (c - 1)
  in
  List.rev(aux [1; 0] 0 1 (x - 1))