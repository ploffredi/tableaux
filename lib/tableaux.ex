defmodule Tableaux do
  @moduledoc """
  Documentation for `Tableaux`.
  """

  @spec apply_expression(Expression.t(), :T|:F) :: BinTree.t()
  @doc """
  Hello world.

        ## Examples

      iex> Tableaux.hello()
      :world

  """
  def apply_expression(%Expression{type: :atom, tag: tag}, sign) do
    %BinTree{
      value: {tag, sign}
    }
  end


  def apply_expression(%Expression{type: :not, e2: e}, :T) do
    apply_expression(e, :F)
  end

  def apply_expression(%Expression{type: :not, e2: e}, :F) do
    apply_expression(e, :T)
  end


  def apply_expression(%Expression{type: :conjunction, e1: e1, e2: e2}, :T) do
    %BinTree{
      value: {e1, :T},
      left: %BinTree{
        value: {e2, :T},
      }
    }
  end

  # &&&, ^^^, <<<, >>>, |||, ~~~
end
