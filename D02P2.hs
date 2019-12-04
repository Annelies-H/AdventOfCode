module D02P2 where

import Data.List (tails)

{-
Find the two box-id's that differ are the same except for one character.
Return the string of characters that these two boxes have in common
-}


inputFile = "D:/AdventOfCode/D02_input.txt"

testList =
    [ "abcde"
    , "fghij"
    , "klmno"
    , "pqrst"
    , "fguij"
    , "axcye"
    , "wvxyz"
    ]
-- the second and fourth in the list differ by only 1 character (the middle one)
-- the script should return fgij

--permutations maakt een lijst tuples met daarin alle mogelijke boxid combinaties uit de inputlijst    
permutations :: [a] -> [(a, a)]
permutations [] = []
permutations (x:xs) = map ((,) x) xs ++ permutations xs  




-- commonChars neemt een tuple met twee boxid's als input en genereert een string
-- met daarin elke letter die in beide boxid's op dezelfde plek voorkomt 
commonChars :: (String,String) -> String
commonChars (xs,ys) = go xs ys ""
    where
        go "" _ common = reverse common
        go _ "" common = reverse common
        go (x:xs) (y:ys) common
            | x == y = go xs ys (x:common) -- gelijk is toevoegen
            | otherwise = go xs ys common -- ongelijk is niet toevoegen

--commonsList neemt een inputlijst, maakt daarvan een lijst met alle mogelijke combinaties met permutaties,
-- en mapt hierover de commonChars functie
commonsList :: [String] -> [String]
commonsList = map commonChars . permutations   

 

-- de lengte van de common chars zou eentje minder moeten zijn dan
-- de originele ID lengte, er is maar één mogelijkheid 
-- idLength geeft de lengte van de eerste string in de lijst
idLength :: [String] -> Int
idLength = length . head

-- maakt een lijst van alle gelijke letters in de alle boxid combinaties
-- returns de gelijke letters in de twee boxid's waarbij de gelijke letters 
-- 1 lager ligt dan de lengte van de originele boxids
answer :: [String] -> Maybe String
answer xs = go (commonsList xs)
    where
        go [] = Nothing
        go (y:ys) = case length y == idLength xs - 1 of
                         True -> Just y
                         False -> go ys

main :: IO ()
main = do
    inputList <- lines <$> readFile inputFile
    print $ answer inputList