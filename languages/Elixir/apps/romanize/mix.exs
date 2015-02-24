defmodule Romanize.Mixfile do
  use Mix.Project

  def project do
    [app: :romanize,
     version: "0.0.1",
     elixir: "~> 1.0",
     escript: [ main_module: Romanize, path: "../../romanize" ],
     deps: deps]
  end

  defp deps do
    []
  end
end
