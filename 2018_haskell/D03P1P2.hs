module D03P1P2 where

--import Control.Monad (forM_)
import Data.Void
import Text.Megaparsec
import Text.Megaparsec.Char
import Text.Megaparsec.Char.Lexer
--import System.Environment
import qualified Data.Map.Strict as M
import Foreign.Marshal.Utils
import Data.IntSet (IntSet)
import qualified Data.IntSet as IS

inputFile :: String
inputFile = "D:/AdventOfCode/D03_input.txt"

type Parser = Parsec Void String

data Claim =
    Claim { claimID :: Int
          , x1 :: Int    -- eerste x
          , xn :: Int    -- laatste x
          , y1 :: Int    -- eerste y
          , yn :: Int }  -- laatste y
    deriving (Show)

testList :: [String]
testList =
    [ "#1 @ 1,3: 4x4"
    , "#2 @ 3,1: 4x4"
    , "#3 @ 5,5: 2x2"
    ]
    
testClaim :: Claim
testClaim = Claim 123 3 4 2 4

testClaims :: [Claim]
testClaims = [Claim 1 1 4 3 6, Claim 2 3 6 1 4, Claim 3 5 7 5 7]

-- combine two strings into a list of x and y coordinate tuples
combo :: [Int] -> [Int] -> [(Int,Int)]
combo xs ys = (,) <$> xs <*> ys

-- create a list of the (x,y) coordinates claimed in one claim
coordinates :: Claim -> [(Int,Int)]
coordinates xs = combo [(x1 xs)..(xn xs)] [(y1 xs)..(yn xs)]

-- create a map of one claim key: (x,y)-coord value:1
coordCountMap :: Claim -> M.Map (Int, Int) Int
coordCountMap = M.fromList . map (\x-> (x,1)) . coordinates

-- creates a map of all claimed coordinates (the key)
-- plus the number of times a coordinate was claimed (the value)  
coordCounts :: [Claim] -> M.Map (Int, Int) Int
coordCounts = M.unionsWith (+) . map coordCountMap

--
--THE ANSWER TO PART 1
--
-- fromBool -> Data.Bool.bool
twoOrMoreTotal :: [Claim] -> Int
twoOrMoreTotal = 
    M.foldr (+) 0 . M.map (fromBool . (>1)). coordCounts 

--PART 2
--create Map of coordinates as key, set of the claimid as value   
coordIDMap :: Claim -> M.Map (Int, Int) IntSet
coordIDMap claim = 
    M.fromList $ map (\x-> (x,IS.singleton $ claimID claim)) (coordinates claim)  

--combine all individual coordIDMaps in one map
--with the claimed coordinates as key
--with a set of the claimids as the value
coordIDMaps :: [Claim] -> M.Map (Int, Int) IntSet
coordIDMaps = M.unionsWith (IS.union) . map coordIDMap    

--function returning only sets of 2 claimid's or bigger
--otherwise an empty map is returned
twoOrMoreSet :: IntSet -> IntSet
twoOrMoreSet xs = case IS.size xs > 1 of
    True -> xs
    False -> IS.empty

--create a set of all claimID's that claim a double claimed space
doubleClaims :: [Claim] -> IntSet
doubleClaims xs = 
    M.foldr (IS.union . twoOrMoreSet) IS.empty (coordIDMaps xs)   
    
singleClaim :: [Claim] -> Maybe Int
singleClaim claimList = go claimList (doubleClaims claimList)
    where
        go [] _ = Nothing
        go (x:xs) doubles 
            | IS.notMember (claimID x) doubles = Just $ claimID x
            | otherwise = go xs doubles

--  

main :: IO ()
main = do
    --inputList <- lines <$> readFile inputFile
    --parsedClaims = map (runParser claimParser inputFile) inputList
    --print $ fmap twoOrMoreTotal (sequence parsedClaims)
    --sequence :: (Traversable t, Monad m) => t (m a) -> m (t a) , omdat hierboven parsedClaism [Either Error Claim] als type heeft
    input <- readFile inputFile
    print $ fmap twoOrMoreTotal (parsedClaims input)
    print $ fmap singleClaim (parsedClaims input)


--
--PARSER
--

--sepEndBy1 :: MonadPlus m => m a -> m sep -> m [a] 
--sep = seperator, in dit geval de eol (end of line)       
parsedClaims :: String -> Either (ParseError Char Void) [Claim]    
parsedClaims = (runParser (sepEndBy claimParser eol) inputFile)

claimParser :: Parser Claim
claimParser = do
    _ <- char '#'
    nr <- decimal
    _ <- string " @ "
    x1' <- decimal
    _ <- char ','
    y1' <- decimal
    _ <- string ": "
    xn' <- decimal
    _ <- char 'x'
    yn' <- decimal
    return $ Claim nr x1' (x1' + xn' - 1) y1' (y1' + yn' - 1)
 

  