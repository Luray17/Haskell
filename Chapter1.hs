import Data.List (sortBy)

-- HC1T1 - Task 1: Function Composition
double :: Int -> Int
double x = x * 2

increment :: Int -> Int
increment x = x + 1

doubleThenIncrement :: Int -> Int
doubleThenIncrement = increment . double
-- applies double first, then increment


-- HC1T2 - Task 2: Pure Function Example
circleArea :: Floating a => a -> a
circleArea r = pi * r * r


-- HC1T3 - Task 3: Checking if a Number is Greater than 18
greaterThan18 :: Int -> Bool
greaterThan18 x = x > 18


-- HC1T4 - Task 4: Composing a Function to Process Player Data
extractPlayers :: [(String, Int)] -> [String]
extractPlayers players = [name | (name, _) <- players]

sortByScore :: [(String, Int)] -> [(String, Int)]
sortByScore players = reverse (sortBy (\(_, s1) (_, s2) -> compare s1 s2) players)

topThree :: [(String, Int)] -> [(String, Int)]
topThree players = take 3 players

getTopThreePlayers :: [(String, Int)] -> [String]
getTopThreePlayers = extractPlayers . topThree . sortByScore


-- HC1T5 - Task 5: Laziness in Haskell
infiniteNumbers :: [Int]
infiniteNumbers = [1..]

takeN :: Int -> [Int]
takeN n = take n infiniteNumbers


-- HC1T6 - Task 6: Using Type Signatures
addNumbers :: Int -> Int -> Int
addNumbers x y = x + y


-- HC1T7 - Task 7: Converting Fahrenheit to Celsius
fToC :: Floating a => a -> a
fToC f = (f - 32) * 5 / 9


-- HC1T8 - Task 8: Higher-Order Functions
applyTwice :: (a -> a) -> a -> a
applyTwice f x = f (f x)


-- MAIN FUNCTION FOR TESTING ALL TASKS
main :: IO ()
main = do
    putStrLn "HC1T1 - doubleThenIncrement (5):"
    print (doubleThenIncrement 5)   -- (5*2)+1 = 11

    putStrLn "\nHC1T2 - circleArea (r=3):"
    print (circleArea 3)            -- pi*9

    putStrLn "\nHC1T3 - greaterThan18:"
    print (greaterThan18 20)        -- True
    print (greaterThan18 15)        -- False

    putStrLn "\nHC1T4 - getTopThreePlayers:"
    let players = [("Alice", 50), ("Bob", 70), ("Charlie", 65), ("Diana", 80)]
    print (getTopThreePlayers players)  -- ["Diana","Bob","Charlie"]

    putStrLn "\nHC1T5 - takeN 10 from infiniteNumbers:"
    print (takeN 10)                -- [1,2,3,4,5,6,7,8,9,10]

    putStrLn "\nHC1T6 - addNumbers (7 + 3):"
    print (addNumbers 7 3)          -- 10

    putStrLn "\nHC1T7 - fToC (100°F):"
    print (fToC 100)                -- 37.777...

    putStrLn "\nHC1T8 - applyTwice (*2) 3:"
    print (applyTwice (*2) 3)       -- 12
