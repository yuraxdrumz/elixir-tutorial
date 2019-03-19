#Errors can be rescued using the try/rescue construct:

try do
  raise "OOPs"
rescue
  e in RuntimeError -> IO.inspect e
  #If you don’t have any use for the error, you don’t have to provide it
  #RuntimeError -> "Error!"
end

#In practice, however, Elixir developers rarely use the try/rescue construct. 
# For example, many languages would force you to rescue an error when a file cannot be opened successfully. 
# Elixir instead provides a File.read/1 function which returns a tuple containing information about whether the file was opened successfully

IO.inspect File.read "hello"
# {:error, :enoent}

# There is no try/rescue here. In case you want to handle multiple outcomes of opening a file, 
# you can use pattern matching within the case construct:
case File.read("./helllo.ex") do
  {:ok, body}      -> IO.puts(body) # do something with the `body`
  {:error, reason} -> IO.inspect(reason)# handle the error caused by `reason`
end

#For the cases where you do expect a file to exist (and the lack of that file is truly an error) you may use File.read!/1
# File.read! "unknown"

#In Elixir, we avoid using try/rescue because we don’t use errors for control flow.