defmodule ChatPhoenixWeb.RoomChannel do
  use ChatPhoenixWeb, :channel

  # Join a chat room
  def join("room:lobby", _params, socket) do
    {:ok, socket}
  end

  # Handle incoming messages and broadcast to all clients
  def handle_in("message", %{"body" => body}, socket) do
    broadcast!(socket, "message", %{body: body})
    {:noreply, socket}
  end
end
