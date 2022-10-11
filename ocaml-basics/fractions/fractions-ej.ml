let is_posfrac (a:int) (b:int) = 
  match (a,b) with
  | (a,b) when a>=0 && b>0 -> true
  | (a,b) when a<0 && b<0 -> true
  | (a,b) when b==0 -> failwith "Error: Not a function"
  | _ -> false

let div n1 n2 = n1 /. n2 
let compare_posfrac ((a:int),(b:int)) ((x:int),(y:int)) = 
  match (a,b,x,y) with
  | (a,b,x,y) when ((is_posfrac a b) || (is_posfrac x y))  -> failwith "Error: Fractions no positive"
  | (a,b,x,y) when (div (float a) (float b)) = (div (float x) (float y))  -> 0
  | (a,b,x,y) when (div (float a) (float b)) > (div (float x) (float y))  -> 1
  | _  -> -1

let compare_frac ((a:int),(b:int)) ((x:int),(y:int)) =
  match (a,b,x,y) with
  | (a,b,x,y) when (div (float a) (float b)) = (div (float x) (float y))  -> 0
  | (a,b,x,y) when (div (float a) (float b)) > (div (float x) (float y))  -> 1
  | _  -> -1