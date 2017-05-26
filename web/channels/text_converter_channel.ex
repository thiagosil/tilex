defmodule Tilex.TextConverterChannel do
  use Phoenix.Channel

  def join("text_converter", _message, socket) do
    {:ok, socket}
  end

  def handle_in("convert", %{"markdown" => markdown}, socket) do
    html = Tilex.Markdown.to_html(markdown)

    push socket, "converted", %{html: html}
    {:noreply, socket}
  end
end
