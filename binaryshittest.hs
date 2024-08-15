import Data.Bits (shiftR, (.&.))
import Data.Char (ord)
import Data.List (intercalate)

textToBinary :: String -> String
textToBinary = intercalate " " . map (padBinary . toBinary . ord)

toBinary :: Int -> String
toBinary 0 = "0"
toBinary n = reverse (toBinary' n)
where
    toBinary' 0 = ""
    toBinary' x = let (q, r) = x `divMod` 2 in r : toBinary' q

padBinary :: String -> String
padBinary s = replicate (8 - length s) '0' ++ s

main :: IO ()
main = do
    putStrLn "Enter text to convert to binary:"
    input <- getLine
    putStrLn $ "Binary representation: " ++ textToBinary input
