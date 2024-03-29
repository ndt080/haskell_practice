module Lesson04 (testLesson04) where

import Data.List

-- 01: GCD
eGcd :: Int -> Int -> Int
eGcd a b
  | a <= 0 = 0
  | b <= 0 = 0
  | a > b = eGcd b (a - b)
  | a < b = eGcd (b - a) a
  | otherwise = a

-- 02: POW
pow :: (Integral x, Num p) => p -> x -> p
pow x p
  | p == 0 = 1
  | p == 1 = x
  | even p = pow (x * x) (div p 2)
  | otherwise = x * pow x (p - 1)

-- 02: POW with tail recursion
tailPowFn :: (Integral x, Num p) => p -> x -> p -> p
tailPowFn x p acc
  | p == 0 = acc
  | even p = tailPowFn (x * x) (div p 2) acc
  | otherwise = tailPowFn x (p - 1) (x * acc)

tailPow :: (Integral x, Num p) => p -> x -> p
tailPow x p = tailPowFn x p 1

-- 04: Perfect numbers
perfect :: Integral a => a -> Bool
perfect n = n == sum [i | i <- [1 .. n -1], n `mod` i == 0]

-- 05: The Syracuse Sequence
collatzFn :: Int -> Int -> Int
collatzFn x acc
  | x == 1 = acc
  | even x = collatzFn (div x 2) (acc + 1)
  | otherwise = collatzFn (3 * x + 1) (acc + 1)

collatz :: Int -> Int
collatz x = collatzFn x 1

-- 06: Delannois numbers
delannoy :: Int -> Int -> Int
delannoy n m
  | n == 0 = 1
  | m == 0 = 1
  | otherwise =
    let n' = n - 1
        m' = m - 1
     in delannoy n' m + delannoy n' m' + delannoy n m'

-- 07: Calculating a polynomial
evalPolynomial :: Floating x => [x] -> x -> x
evalPolynomial list x =
  let size = length list - 1
      list' = zip list [size, size - 1 .. 0]
   in sum [a * (x ** fromIntegral deg) | (a, deg) <- list']

-- 08: Cloning list items
clone :: Int -> [a] -> [a]
clone 0 _ = []
clone _ [] = []
clone n list = concat [replicate n a | a <- list]

-- 10: List of Fibonacci numbers
getFibonacciList :: Num a => [a] -> [a]
getFibonacciList [] = []
getFibonacciList (a : as) = a : getFibonacciList (as ++ [sum (a : as)])

-- TESTING MODULE
testLesson04 :: IO ()
testLesson04 = do
  print ("------: LESSON 04 :----------")
  print ("01: eGcd                  (3, 27):   ", eGcd 3 27)
  print ("02: pow                    (3, 4):   ", pow 3 4)
  print ("02: tailPow                (3, 4):   ", tailPow 3 4)
  print ("04: perfect                  (28):   ", perfect 28)
  print ("05: collatz                   (7):   ", collatz 7)
  print ("06: delannoy               (3, 4):   ", delannoy 3 4)
  print ("07: evalPolynomial ([2, 1, 5], 4):   ", evalPolynomial [2, 1, 5] 3)
  print ("08: clone          (3, [1, 2, 3]):   ", clone 3 [1, 2, 3])
  print ("10: getFibonacciList             :   ", take 10 $ getFibonacciList [7, 3, 10, 0])
  print ("-------------------------------")