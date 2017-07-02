# Kurasuta [![Travis](https://img.shields.io/travis/fl9/kurasuta.svg)](https://travis-ci.org/fl9/kurasuta) [![Hex.pm](https://img.shields.io/hexpm/v/kurasuta.svg)](https://hex.pm/packages/kurasuta)

Cluster your data with Elixir. This is work in progress, so please use with care.

## Currently implemented cluster algorithms

- k-means

## Future plans

- Implementation of other cluster algorithms, e.g., DBSCAN
- Code optimization
- Improvement of documentation

## Installation

Install by adding `kurasuta` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [{:kurasuta, "~> 0.1.0"}]
end
```

Then, update your dependencies with `mix deps.get`.

## Usage

Currently only the k-means algorithm is available. For a working example with a two-dimensional list as data, see [`KurasutaTest`](test/kurasuta_test.exs).

## License

Licensed under MIT, see [`LICENSE`](LICENSE).


