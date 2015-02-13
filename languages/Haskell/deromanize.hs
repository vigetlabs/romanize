import System.Environment(getArgs)
import Text.Printf(printf)

(|>) :: a -> (a -> b) -> b
(|>) = flip ($)
 
conversions :: [(Char, Int)]
conversions =  [('I', 1),
                ('V', 5),
                ('X', 10),
                ('L', 50),
                ('C', 100),
                ('D', 500),
                ('M', 1000)]

-- | Given a Roman character, get its Arabic value
valueOf :: Char -> Int
valueOf roman = case lookup roman conversions of
  Just i  -> i
  Nothing -> error "Invalid Roman numeral"  

-- | Get the numerical value of a Roman numeral
deromanize :: [Char] -> Int
deromanize roman = case roman of
  []       -> 0
  [r]      -> valueOf r
  r1:r2:rs -> (if l1 >= l2 then l1 else l1 * (-1)) + deromanize (r2:rs)
              where
                l1 = valueOf r1
                l2 = valueOf r2

main :: IO ()
main = do
  args <- getArgs
  args |> head |> deromanize |> printf "%i" |> putStr
