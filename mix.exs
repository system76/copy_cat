defmodule CopyCat.MixProject do
  use Mix.Project

  def project do
    [
      app: :copy_cat,
      version: "0.1.0",
      elixir: "~> 1.10",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      releases: [
        copy_cat: [
          include_executables_for: [:unix],
          applications: [runtime_tools: :permanent]
        ]
      ]
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger],
      mod: {CopyCat.Application, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:appsignal, "~> 2.0"},
      {:bottle, github: "system76/bottle", ref: "1621c66"},
      {:broadway_sqs, "~> 0.6.0"},
      {:saxy, "~> 1.3"},
      {:hackney, "~> 1.17"},
      {:jason, "~> 1.2", override: true},
      {:credo, "~> 1.5", only: [:dev, :test]}
    ]
  end
end
