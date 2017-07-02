defmodule KurasutaTest do
  use ExUnit.Case

  setup_all do
    data = [
      [2, 7], [1.3, 6], [2.5, 5], [5.8, 5.1], [5.2, 4.3], [4.4, 4], [5.9, 3.6],
      [2.9, 3.1], [1.2, 3], [2, 2.4], [3, 2.2], [1.5, 1.4]
    ]

    {:ok, data: data}
  end

  test 'run/2 with k-means algorithm and given centers', context do
    centers = [[2, 6], [5.3, 4.1], [2.4, 0.7]]
    result = Kurasuta.run(context[:data], algorithm_params: %{k: 3, iterations: 5, centers: centers})
    [c1, c2, c3] = result.clusters

    assert MapSet.new([[2, 7], [1.3, 6], [2.5, 5]]) |> MapSet.equal?(MapSet.new(c1))
    assert MapSet.new([[2.9, 3.1], [1.2, 3], [2, 2.4], [3, 2.2], [1.5, 1.4]]) |> MapSet.equal?(MapSet.new(c2))
    assert MapSet.new([[5.8, 5.1], [5.2, 4.3], [4.4, 4], [5.9, 3.6]]) |> MapSet.equal?(MapSet.new(c3))
  end
end
