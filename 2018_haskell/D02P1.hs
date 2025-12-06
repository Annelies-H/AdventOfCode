module D02P1 where

import Data.List
import Data.Bool

{-
counting the number that have an ID containing exactly two of any 
letter and then separately counting those with exactly three of any
 letter. You can multiply those two counts together to get a 
 rudimentary checksum 
-}


inputFile = "D:/AdventOfCode/D02_input.txt"

testList =
    [ "abcdef"
    , "bababc"
    , "abbcde"
    , "abcccd"
    , "aabcdd"
    , "abcdee"
    , "ababab" ]
    

{-
sort :: Ord a => [a] -> [a] ; zet de inhoud vd string op volgorde
sort "abacab" = "aaabbc"
group :: Eq a [a] -> [[a]] ; maakt een lijst van groepen die hetzelfde zijn
group "aaabbb" = ["aaa", "bb", "c"]
length :: [a] -> Int; (eigenlijk foldable t) lengte van een lijst
map :: (a->b) -> [a] -> [b]
map length ["aaa", "bb", "c"] = [3,2,1]
elem :: Eq a => a -> [a] -> Bool; (eigenlijk foldable t), zit iets in een lijst?
elem 2 [3,2,1] = True
elem 4 [3,2,1] = False
-}
--heeft een string een dubbele?  
hasDuo :: String -> Bool
hasDuo = elem 2 . map length . group . sort
--heeft een string een driedubbele?
hasTriple :: String -> Bool
hasTriple = elem 3 . map length . group . sort

{-
map hasDuo geeft een lijst met bools, waarbij True = duo
bool :: a -> a -> Bool -> a
bool x y True = y ; bool x y False = x
Dus elke string zonder duo wordt 0, elke met string wordt 1
Daarna alles opgeteld geeft het aantal strings met twee dezelfde
-}
totalDuo :: [String] -> Int
totalDuo = sum . map (bool 0 1) . map hasDuo

totalTriple :: [String] -> Int
totalTriple = sum . map (bool 0 1) . map hasTriple

checkSum xs = totalDuo xs * totalTriple xs

-- eigenlijk generieke functie schrijven die int als input
-- neemt en dan voor duo en triple gebruikt kan worden
-- zelfde voro de total functie
-- dan hoef je niet dubbel te schijven
hasDuplo :: Int -> String -> Bool
hasDuplo n = elem n . map length . group . sort
--etc etc

main :: IO ()
main = do
  inputList <- lines <$> readFile inputFile
  print $ checkSum inputList 