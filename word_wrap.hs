module WordWrap (
  wrap
) where

import Data.List (splitAt, take)

splitAtWord :: String -> Int -> (String, String)
splitAtWord s colLength = 
  if (s !! colLength == ' ')
  then
    let (firstLine, rest) = splitAt colLength s
    in (firstLine, tail rest)
  else splitAtWord s $ colLength - 1

wrap :: String -> Int -> String
wrap s colLength =
  if length s <= colLength
  then s
  else
    let (firstLine, rest) = splitAtWord s colLength
    in firstLine ++ "\n" ++ (wrap rest colLength)