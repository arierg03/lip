let rec rnd_list (n:int) (b:int) : int list = 
  if (n = 0) then [] 
  else 1+Random.int b::rnd_list (n-1) b;;