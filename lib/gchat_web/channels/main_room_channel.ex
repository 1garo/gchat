defmodule GchatWeb.MainRoomChannel do
  use GchatWeb, :channel

  alias Gchat.Chats

  @impl true
  def join("main_room:lobby", _payload, socket) do
      {:ok, socket}
  end

  # It is also common to receive messages from the client and
  # broadcast to everyone in the current topic (main_room:lobby).
  @impl true
  def handle_in("shout", payload, socket) do
    Chats.create_message(payload)
    broadcast socket, "shout", payload
    {:noreply, socket}
  end

end
