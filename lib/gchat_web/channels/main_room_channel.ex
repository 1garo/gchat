defmodule GchatWeb.MainRoomChannel do
  use GchatWeb, :channel
  require Logger
  alias Gchat.Chats

  @impl true
  def join("main_room:lobby", _payload, socket) do
      {:ok, socket}
  end

  # It is also common to receive messages from the client and
  # broadcast to everyone in the current topic (main_room:lobby).
  @impl true
  def handle_in("shout", payload = %{"name" => name}, socket) when name == "" or is_nil(name) do
    Logger.debug "entrou aqui"
    handle_in("shout", %{payload | "name" => "user"}, socket)
  end

  def handle_in("shout", payload, socket) do
    Logger.debug "entrou" 
    Chats.create_message(payload)
    broadcast socket, "shout", payload
    {:noreply, socket}
  end
end
