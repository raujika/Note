import Data.Char
import Data.List
import Control.Monad (ap)


newtype Parser s a = P { runP :: s -> Maybe (a, s) }

string :: String -> Parser String String
string pat = P $ \input ->
  case stripPrefix pat input of
    Nothing   -> Nothing
    Just rest -> Just (pat, rest)

number :: Parser String Int
number = P $ \s -> 
    let
        (hd, tl) = span isDigit s
    in
        case reads hd of
          [(n, _)] -> Just (n, tl)
          _        -> Nothing

shove :: a -> Parser s a
shove a = P $ \input -> Just (a, input)

bind :: Parser s a -> (a -> Parser s b) -> Parser s b
bind parse next = P $ \input ->
  case runP parse input of
    Nothing          -> Nothing
    Just (a, input') -> runP (next a) input'

instance Functor (Parser s) where
  fmap f parser = P $ \input ->
    case runP parser input of
      Nothing          -> Nothing
      Just (a, input') -> Just (f a, input')

instance Applicative (Parser s) where
  pure  = return
  (<*>) = ap

instance Monad (Parser s) where
  (>>=)  = bind
  return = shove

version3 = do
    string "HTTP/"
    maj <- number
    string "."
    min <- number
    return (maj,min)

version4 = (,) <$>
           (string "HTTP/" *> number <* string ".") <*>
           number

(.*>) :: String -> Parser String b -> Parser String b
a .*> b = string a *> b
infixl 4 .*>

(<*.) :: Parser String a -> String -> Parser String a
a <*. b = a <* string b
infixl 4 <*.

version5 = (,) <$> ("HTTP/" .*> number <*. ".")
               <*> number