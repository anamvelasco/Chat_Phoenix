defmodule ChatPhoenixWeb.RoomChannelTest do
  use ChatPhoenixWeb.ChannelCase, async: true

  setup do
    {:ok, _, socket} =
      ChatPhoenixWeb.UserSocket
      |> socket("user_id", %{some: :assign})
      |> subscribe_and_join(ChatPhoenixWeb.RoomChannel, "room:lobby")

    %{socket: socket}
  end

  test "broadcasts message to room:lobby", %{socket: socket} do
    push socket, "message", %{body: "hello"}
    assert_broadcast "message", %{body: "hello"}
  end
end
