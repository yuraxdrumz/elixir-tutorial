#Structs provide compile-time guarantees that only the fields (and all of them) defined through defstruct will be allowed to exist in a struct:
defmodule User do
  @enforce_keys [:name, :age]
   defstruct [:name, :age]
end