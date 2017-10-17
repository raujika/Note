import Data.Char
import Data.List


type Parser s a = s -> Maybe (a, s)

string :: String -> Parser String String
string pat input =
  case stripPrefix pat input of
    Nothing   -> Nothing
    Just rest -> Just (pat, rest)

number :: Parser String Int
number s = case reads hd of
             [(n, _)] -> Just (n, tl)
             _        -> Nothing
    where
        (hd, tl) = span isDigit s


version :: Parser String (Int, Int)
version s0 =
    case string "HTTP/" s0 of
      Nothing -> Nothing
      Just (_, s1) ->
          case number s1 of
            Nothing -> Nothing
            Just (maj, s2) ->
                case string "." s2 of
                  Nothing -> Nothing
                  Just (_, s3) ->
                      case number s3 of
                        Nothing -> Nothing
                        Just (min, s4) -> Just ((maj, min), s4)


andThen :: Parser s a -> (a -> Parser s b) -> Parser s b
andThen parse next = \input ->
    case parse input of
      Nothing -> Nothing
      Just (a, input') -> next a input'

version1 =
    string "HTTP/" `andThen` \_ ->
    number `andThen` \maj ->
    string "." `andThen` \_ ->
    number `andThen` \min ->
    \s -> Just ((maj, min), s)

stuff :: a -> Parser s a
stuff a = \s -> Just (a, s)

version2 =
    string "HTTP/" `andThen` \_ ->
    number `andThen` \maj ->
    string "." `andThen` \_ ->
    number `andThen` \min ->
    stuff (maj, min)