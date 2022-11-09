module Z04 (eGcd) where

eGcd :: Int -> Int -> Int
eGcd a b
  | a <= 0 = 0
  | b <= 0 = 0
  | a > b = eGcd b (a - b)
  | a < b = eGcd (b - a) a
  | otherwise = a

main = do
  print (eGcd 3 27)