# # Alias the module so it can be called as Bar instead of Foo.Bar
# alias Foo.Bar, as: Bar

# # Require the module in order to use its macros
# require Foo

# # Import functions from Foo so they can be called without the `Foo.` prefix
# import Foo

# # Invokes the custom code defined in Foo as an extension point
# use Foo

# #Note that alias is lexically scoped, which allows you to set aliases inside specific functions:
# defmodule Math do
#   def plus(a, b) do
#     alias Math.List
#     # ...
#   end

#   def minus(a, b) do
#     # ...
#   end
# end
