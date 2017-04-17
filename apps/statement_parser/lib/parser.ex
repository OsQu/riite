defmodule Parser do
  @type path :: String.t

  @callback parse(path) :: list
  @callback valid?(path) :: list
end
