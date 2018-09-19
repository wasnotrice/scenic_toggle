defmodule Scenic.Toggle.Components do
  @moduledoc """
  A set of helper functions for working with toggle components.
  """

  alias Scenic.Graph
  alias Scenic.Primitive

  alias Scenic.Component.Toggle

  @doc """
  Add toggle to a Scenic graph.

  You must pass the initial state, `on?`. Pass `true` if the toggle is on, pass `false` if not.

  ### Styles

  Toggles honor the following styles. The `:light` and `:dark` styles look nice. The other bundled themes...not so much. You can also [supply your own theme](Scenic.Toggle.Components.html#toggle/3-theme).

  * `:hidden` - If `false` the toggle is rendered. If true, it is skipped. The default
    is `false`.
  * `:theme` - The color set used to draw. See below. The default is `:dark`

  ### Additional Styles

  Toggles also honor the following additional styles.

  * `:border_width` - the border width. Defaults to `2`.
  * `:padding` - the space between the border and the thumb. Defaults to `2`
  * `:thumb_radius` - the radius of the thumb. This determines the size of the entire toggle. Defaults to `10`.

  ## Theme

  To pass in a custom theme, supply a map with at least the following entries:

  * `:border` - the color of the border around the toggle
  * `:background` - the color of the track when the toggle is `off`.
  * `:text` - the color of the thumb.
  * `:thumb` - the color of the track when the toggle is `on`.

  Optionally, you can supply the following entries:

  * `:thumb_pressed` - the color of the thumb when pressed. Defaults to `:gainsboro`.

  ### Examples

  The following example creates a toggle.
      graph
      |> toggle(true, translate: {20, 20})

  The next example makes a larger toggle.
      graph
      |> toggle(true, translate: {20, 20}, thumb_radius: 14)
  """
  @spec toggle(Graph.t() | Primitive.t(), any, Keyword.t() | nil) :: Graph.t()
  def toggle(graph, data, options \\ [])

  def toggle(%Graph{} = g, data, options) do
    add_to_graph(g, Toggle, data, options)
  end

  def toggle(%Primitive{module: SceneRef} = p, data, options) do
    modify(p, Toggle, data, options)
  end

  # ============================================================================
  # internal utilities

  @spec add_to_graph(Graph.t(), Toggle, any, Keyword.t()) :: Graph.t()
  defp add_to_graph(%Graph{} = g, mod, data, options) do
    mod.verify!(data)
    mod.add_to_graph(g, data, options)
  end

  @spec modify(Primitive.t(), Toggle, any, Keyword.t()) :: Primitive.t()
  defp modify(%Primitive{module: SceneRef} = p, mod, data, options) do
    mod.verify!(data)
    Primitive.put(p, {mod, data}, options)
  end
end
