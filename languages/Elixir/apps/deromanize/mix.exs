defmodule Deromanize.Mixfile do
  use Mix.Project

  def project do
    [app: :deromanize,
     version: "0.0.1",
     elixir: "~> 1.0",
     escript: [ main_module: Deromanize, path: "../../deromanize" ],
     deps: deps]
  end

  defp deps do
    []
  end
end
