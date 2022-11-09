module Z04 (pow) where

pow :: (Integral x, Num p) => p -> x -> p
pow x p
  | p == 0 = 1
  | p == 1 = x
  | even p = pow (x * x) (div p 2)
  | otherwise = x * pow x (p - 1)

main = do
  print (pow 3 4)