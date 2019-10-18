module Pyramid (
  longestSlideDown
) where

import Data.List (foldl')

longestSlideDown :: [[Int]] -> Int
longestSlideDown xs = snd . foldl' f (0,0) $ xs
  where
    f :: (Int, Int) -> [Int] -> (Int, Int)
    f (idx,acc) [] = (idx,acc)
    f (idx,acc) (y:[]) = (0,acc + y)
    f (idx,acc) ys =
      let a = ys !! idx
          b = ys !! (idx + 1)
      in if a > b
      then (idx, (acc + a))
      else ((idx + 1) , (acc + b))