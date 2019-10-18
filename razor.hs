module Razor (
  Razor(..),
  interpret,
  pretty
) where

data Razor
  = Lit Int
  | Add Razor Razor
  | Mul Razor Razor
  | Cat Razor Razor

interpret :: Razor -> Int
interpret (Lit x) = x
interpret (Add x y) = interpret x + interpret y
interpret (Mul x y) = interpret x * interpret y
interpret (Cat x y) = read $ (show . interpret $ x) ++ (show . interpret $ y)


pretty :: Razor -> String
pretty (Lit x) = show x
pretty (Add x y) = "(" ++ pretty x ++ " + " ++ pretty y ++ ")"
pretty (Mul x y) = "(" ++ pretty x ++ " * " ++ pretty y ++ ")"
pretty (Cat x y) = "(" ++ pretty x ++ " ++ " ++ pretty y ++ ")"