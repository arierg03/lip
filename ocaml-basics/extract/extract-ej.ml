let rec remove i l sofar = 
  if i=0 then ((List.hd l) , (List.rev(sofar)@(List.tl l)))
  else remove (i-1) (List.tl l) (List.hd l::sofar)
;;
  

let extract (i:int) (l:'a list) : ('a * 'a list)= 
  match (i,l) with
  | (i,l) when (i>=List.length l) || i<0 -> failwith "Index out of bounds"
  | _ -> remove i l []
;;