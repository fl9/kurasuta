defmodule Kurasuta do
  @algorithms %{
    kmeans: Kurasuta.Algorithms.Kmeans
  }
  @default_algorithm :kmeans
  @default_algorithm_params %{
    iterations: 10
  }

  @doc """
  Returns result of chosen cluster algorithm given
  `data` and options  `opts`.
  """
  def run(data, opts \\ []) do
    opts = Keyword.merge([
      algorithm: @default_algorithm,
      algorithm_params: @default_algorithm_params
    ], opts)

    @algorithms[opts[:algorithm]].run(data, opts[:algorithm_params])
  end
end
