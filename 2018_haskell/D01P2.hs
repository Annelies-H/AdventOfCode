module D01P2 where

--The list of changes repeats itself
--What is the first frequency your device reaches twice?  

--import System.Environment

inputFile :: String
inputFile = "D:/AdventOfCode/D01P1_input.txt"

inputList :: IO [String]
inputList = lines <$> readFile inputFile

-- read positive numbers without the '+' by skipping the '+'
-- read negative numbers with the '-'
readChanges :: String -> Int
readChanges ('+':xs) = read xs
readChanges xs = read xs

-- loop inputlist to get infinite list of frequency changes
-- cycle creates an infinite repeat of the input list
-- which is the list of strings turned into a ist of nts
changeList :: [String] -> [Int]   
changeList list = cycle $ readChanges <$> list
-- changelist korter opgeschreven
f :: [String] -> [Int]
f = cycle . map readChanges

-- get a list of subsequent/cummulative frequenies from the changelist 
-- starting with 0
-- scanl :: (b -> a -> b) -> b -> [a] -> [b]
freqList :: [String] -> [Int]
freqList list = scanl (+) 0 (changeList list) 

-- give the first double value in the list
-- return Nothing when no doubles are found
checkDouble :: [Int] -> Maybe Int
checkDouble list = go list []
    where
       go [] _ = Nothing  -- when no doubles are found at end list
       go (x:xs) prev =  -- prev starts as []
        case elem x prev of 
            True -> Just x -- if x is in the prev list the double is found
            False -> go xs (x:prev) 
            -- if x is not in prev there is no double yet, x is
            -- added to prev and a new value is added and compared
        
                   
main :: IO ()
main = do
  input <- lines <$> readFile inputFile
  -- creates a list of strings containing the input
  print . checkDouble $ freqList input
  -- takes the list of strings and transforms it into a list of
  -- cumulative frequencies, which is then checked for doubles
  -- the result is printed, which is either Just # or Nothing
