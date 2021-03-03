defmodule GchatWeb.PageController do
  use GchatWeb, :controller

  alias Gchat.Chats
  def index(conn, _params) do
    message = Chats.list_messages()
    render(conn, "index.html", messages: message)
  end
end
