defmodule ScenicToggle.MixProject do
  use Mix.Project

  @version "0.1.0"
  @scenic_version "0.7.0"
  @github "https://github.com/wasnotrice/scenic_toggle"

  def project do
    [
      app: :scenic_toggle,
      version: @version,
      elixir: "~> 1.7",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      docs: [
        main: "Scenic.Toggle.Components"
      ],
      description: description(),
      name: "Scenic Toggle",
      source_ref: "v#{@version}",
      source_url: @github,
      package: [
        contributors: ["Eric Watson"],
        maintainers: ["Eric Watson"],
        licenses: ["Apache 2"],
        links: %{github: @github}
      ]
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    []
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:credo, "~> 0.10", only: :dev, runtime: false},
      {:dialyxir, "~> 1.0.0-rc.3", only: :dev, runtime: false},
      {:ex_doc, "~> 0.19", only: :dev, runtime: false},
      {:scenic, @scenic_version}

      # {:dep_from_hexpm, "~> 0.3.0"},
      # {:dep_from_git, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"},
    ]
  end

  def description do
    """
    Scenic.Toggle — On/off toggle component for Scenic
    """
  end
end
