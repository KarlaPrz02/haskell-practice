import Text.Read (readMaybe)

data Operation = Add | Subtract | Multiply | Divide deriving Show

calculate : : Operation -> Double -> Double -> Double
calculate Add x y = x + y
calculate Subtract x y = x - y
calculate Multiply x y = x * y
calculate Divide x y = x / y

main : : IO ()
main = do
    putStrLn "Enter the first number: "
    num1Str <- getLine
    putStrLn "Enter the second number: "
    num2Str <- getLine
    putStrLn "Enter the operation: "
    OpStr <- getLine 

    case (readMaybe num1Str : : Maybe Double, readMaybe num2Str : : Maybe Double, readMaybe OpStr : : Maybe Operation) of
        (Just num1, Just num2, Just op) -> do
            let result = calculate op num1 num2
            putStrLn ("The result is: " ++ show result)
        _ -> putStrLn "Invalid input. Please enter valid numbers and an operation."

