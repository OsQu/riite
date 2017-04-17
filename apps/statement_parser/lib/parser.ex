defmodule Parser do
  @type path :: String.t

  @callback parse(path) :: [%Statement{}]
  @callback valid?(path) :: [%Statement{}]
end
