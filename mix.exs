defmodule Kurasuta.Mixfile do
  use Mix.Project

  def project do
    [
      app: :kurasuta,
      version: "0.1.0",
      elixir: "~> 1.4",
      build_embedded: Mix.env == :prod,
      start_permanent: Mix.env == :prod,
      description: description(),
      package: package(),
      deps: deps(),
      name: "kurasuta",
      source_url: "https://github.com/fl9/kurasuta"
   ]
  end

  def application do
    []
  end

  defp deps do
    [
      {:dialyxir, "~> 0.5", only: [:dev], runtime: false},
      {:ex_doc, "~> 0.14", only: :dev, runtime: false}
    ]
  end

  defp description do
    """
    Clustering library for Elixir
    """
  end

  defp package do
    [
      files: ["lib", "mix.exs", "README.md", "LICENSE"],
      maintainers: ["Florian Hübsch"],
      licenses: ["MIT"],
      links: %{"GitHub" => "https://github.com/fl9/kurasuta"}
    ]
  end
end
