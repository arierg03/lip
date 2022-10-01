let max_nat a b =
  if(a<0 || b<0) then
    failwith "Numeri negativi"
  else (if(a>b) then a else b);;