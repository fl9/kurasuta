defmodule Kurasuta.Algorithms.Kmeans do
  @moduledoc """
  Implementation of k-means clustering algorithm.
  """

  defstruct centers: [], clusters: []

  alias Kurasuta.Algorithms.Kmeans
  alias Kurasuta.Vector

  @type data :: list(Vector.vector)
  @type params :: map
  @type centers :: list(Vector.vector)
  @type cluster :: list(Vector.vector)
  @type clusters :: list(cluster)

  @doc """
  Returns result of the k-means algorithm given `data`
  and algorithm params `params`.
  """
  @spec run(data, params) :: %Kmeans{}
  def run(data, params = %{iterations: iterations}) do
    centers = step(data, initial_centers(data, params), iterations)

    %Kmeans{
      centers: centers,
      clusters: cluster_assignment(data, centers)
    }
  end

  @spec step(data, centers, non_neg_integer) :: centers
  defp step(_, centers, 0) do
    centers
  end
  defp step(data, centers, iterations) do
    new_centers = cluster_assignment(data, centers)
                  |> new_cluster_centers
    step(data, new_centers, iterations - 1)
  end

  @spec initial_centers(data, params) :: centers
  defp initial_centers(_data, %{k: _, centers: centers}) do
    centers
  end
  defp initial_centers(data, %{k: k}) do
    data
    |> Enum.take_random(k)
  end

  @spec cluster_assignment(data, centers) :: clusters
  defp cluster_assignment(data, centers) do
    Enum.group_by(data, fn(x) -> Enum.min_by(centers, &Vector.euclidean_distance(&1, x)) end)
    |> Map.values
  end

  @spec new_cluster_centers(clusters) :: centers
  defp new_cluster_centers(clusters) do
    clusters |> Enum.map(&mean(&1))
  end

  @spec mean(cluster) :: Vector.vector
  defp mean(cluster) do
    cluster
    |> Enum.reduce(fn(x, acc) -> Vector.add(x, acc) end)
    |> Vector.div(length(cluster))
  end
end
