import Control.Monad
import Text.Printf

combi _ 0 = 1
combi r n = combi r (n - 1) * (r - n + 1) `div` n

main = do
    let height = 12
    forM [0..height - 1] (\r -> do
        putStr $ take ((height - r) * 3) $ cycle " "
        sequence [printf "%6d" (combi r n) | n <- [0..r]]
        putStrLn "")