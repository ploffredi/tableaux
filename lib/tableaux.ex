defmodule Tableaux do
  @moduledoc """
  Documentation for `Tableaux`.
  """

  import BinTree



  def linear_branch_from_list([h]) do
    %BinTree{value: h}
  end

  def linear_branch_from_list([h|t]) do
    %BinTree{value: h, left: linear_branch_from_list(t)}
  end

  def add_alpha_rules(nil, list) do
    linear_branch_from_list(list)
  end


  def add_alpha_rules(%BinTree{left: nil, right: nil}=tree, list) do
    %BinTree{tree | left: linear_branch_from_list(list)}
  end

  def add_alpha_rules(%BinTree{left: nil, right: right}=tree, list) do
    %BinTree{tree |
          right: add_alpha_rules(right, list)
        }
  end

  def add_alpha_rules(%BinTree{left: left, right: nil}=tree, list) do
    %BinTree{tree |
          left: add_alpha_rules(left, list)
        }
  end

  def add_alpha_rules(%BinTree{left: left, right: right}=tree, list) do
    %BinTree{tree |
          left: add_alpha_rules(left, list),
          right: add_alpha_rules(right, list)
        }
  end

  def add_beta_rules(%BinTree{left: nil, right: nil}=tree, lexp, rexp) do
    %BinTree{tree | left: %BinTree{value: lexp}, right: %BinTree{value: rexp}}
  end

  def add_beta_rules(%BinTree{left: nil, right: right}=tree, lexp, rexp) do
    %BinTree{tree |
          right: add_beta_rules(right, lexp, rexp)
        }
  end

  def add_beta_rules(%BinTree{left: left, right: nil}=tree, lexp, rexp) do
    %BinTree{tree |
          left: add_beta_rules(left, lexp, rexp)
        }
  end

  def add_beta_rules(%BinTree{left: left, right: right}=tree, lexp, rexp) do
    %BinTree{tree |
          left: add_beta_rules(left,  lexp, rexp),
          right: add_beta_rules(right, lexp, rexp)
        }
  end
end
