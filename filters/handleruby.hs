-- handleruby.hs
import Text.Pandoc.JSON
import Text.Printf
import System.Environment (getArgs)

handleRuby :: Maybe Format -> Inline -> Inline
handleRuby (Just format) (Link [Str ruby] ('-':kanji,_))
  | format == Format "html"  = RawInline format $ "<ruby>" ++ kanji ++ "<rp>(</rp><rt>" ++ ruby ++ "</rt><rp>)</rp></ruby>"
  | format == Format "epub3" = RawInline (Format "html") $ "<ruby>" ++ kanji ++ "<rp>(</rp><rt>" ++ ruby ++ "</rt><rp>)</rp></ruby>"
  | format == Format "latex" = RawInline format $ "\\ruby{" ++ kanji ++ "}{" ++ ruby ++ "}"
  | otherwise = Str ruby

handleRuby _ x = x

main :: IO ()
main = toJSONFilter handleRuby
