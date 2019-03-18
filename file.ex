case File.read("./helllo.ex") do
  {:ok, body}      -> IO.puts(body) # do something with the `body`
  {:error, reason} -> # handle the error caused by `reason`
end
