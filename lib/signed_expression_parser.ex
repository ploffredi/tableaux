defmodule SignedExpressionParser do


  @spec parse(binary) :: list
  def parse(str) do
    {:ok, tokens, _} = str |> to_charlist() |> :signed_expression_lexer.string()
    {:ok, list} = :signed_expression_parser.parse(tokens)
    list
  end
end
