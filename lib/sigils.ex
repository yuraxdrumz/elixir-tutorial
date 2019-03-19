#The most common sigil in Elixir is ~r, which is used to create regular expression

regex = ~r/foo|bar/

IO.inspect "foo" =~ regex
IO.inspect "bat" =~ regex

# ~s sigil allows creating string with double qoutes for example
IO.inspect ~s(this is a string with "double" quotes, not 'single' ones)

IO.inspect ~w(this is a word list sigil)
IO.inspect ~w(this is an atom list sigil)a

#Besides lowercase sigils, Elixir supports uppercase sigils to deal with escaping characters and interpolation. 
#While both ~s and ~S will return strings, the former allows escape codes and interpolation while the latter does not:

IO.inspect ~s(String with escape codes \x26 #{"inter" <> "polation"})
IO.inspect ~S(String without escape codes \x26 without #{interpolation})

@doc ~S"""
Converts double-quotes to single-quotes.

## Examples

    iex> convert("\"foo\"")
    "'foo'"

"""
# def convert(...)