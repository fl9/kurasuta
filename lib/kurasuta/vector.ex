defmodule Kurasuta.Vector do
  @moduledoc """
  Functions that work on vectors (list of numbers).
  """

  @type vector :: list(number)

  @doc """
  Adds `x` and `y` componentwise.

  ## Examples

      iex> Kurasuta.Vector.add([1.2, 2, 3], [4, 5, 6])
      [5.2, 7, 9]

  """
  @spec add(vector, vector) :: vector
  def add(x, y) do
    Enum.zip(x, y)
    |> Enum.map(fn {c1, c2} -> c1 + c2 end)
  end

  @doc """
  Scalar multiplication of `x` by `1/c`.

  ## Examples

      iex> Kurasuta.Vector.div([4, 6, 8], 2)
      [2.0, 3.0, 4.0]

  """
  # TODO fall c = 0
  @spec div(vector, number) :: vector
  def div(x, c) do
    x |> Enum.map(&(&1/c))
  end

  @doc """
  Returns the euclidean distance between `x` and `y`.

  ## Examples

      iex> Kurasuta.Vector.euclidean_distance([2, 3], [4, 5])
      :math.sqrt(8)

  """
  @spec euclidean_distance(vector, vector) :: number
  def euclidean_distance(x, y) do
    Enum.zip(x, y)
    |> Enum.map(fn {c1, c2} -> :math.pow(c2 - c1, 2) end)
    |> Enum.sum
    |> :math.sqrt
  end
end
