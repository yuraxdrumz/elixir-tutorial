#Structs provide compile-time guarantees that only the fields (and all of them) defined through defstruct will be allowed to exist in a struct:
defprotocol Size do
  def size(value)
end

# defimpl Size, for: User do
#   def size(_user), do: 2
# end

defimpl Size, for: Any do
  def size(_), do: 0
end


defmodule User do
  @derive [Size]
  @enforce_keys [:name, :age]
  defstruct name: "yura", age: 27
end
