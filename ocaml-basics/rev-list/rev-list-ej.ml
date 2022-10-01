let rec rev l = match l with
  [] -> []
| hd :: tl -> rev (tl) @ [hd];;