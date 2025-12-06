module D01P1 where

import System.Environment

{-
-- input contains a list of positive and negative numbers 
-- aka changes to the frequency

Starting with a frequency of zero, what is the resulting frequency 
after all of the changes in frequency have been applied?
-} 
inputfile = "D:/AdventOfCode/D01P1_input.txt"

{-
read :: Read a => String -> a
Because '+' is not recognised as a function read cannot read it
as we specified that we want integers
readchanges therefore filters out the '+' characters, '-' are no
problem as they are part of the negative number
-}
readchanges :: String -> Int
readchanges (x:xs)
    | x == '+' = read xs
    | otherwise = read (x:xs)

-- kan ook zonder guard:
readchanges' ('+':xs) = read xs
readchange' xs = read xs

{-
sum :: (Num a, Foldable t) => t a -> a
sumfreq takes a list of strings, applies readchanges to each
element of the list turning it into a list of string, sum then
takes the sum of the entire list
-}
sumfreq :: [String] -> Int    
sumfreq list = sum $ readchanges <$> list

{-
readFile :: FilePath -> IO Strings
lines :: String -> [String]
answer combineert (sumfreq . lines) and mapped deze dan over
IO String (readFile inputfile)
answer = (sumfreq . lines) <$> (readFile inputfile)
-}

answer :: IO Int
answer = sumfreq . lines <$> readFile inputfile

-- main werkt momenteel niet
main :: IO ()
main = do
    [inputFile] <- getArgs
    input <- readFile inputFile
    print . sumfreq . lines $ input
    