defmodule VexDemoWeb.PageController do
  use VexDemoWeb, :controller

  def index(conn, _params) do
    vex_api_key_id = System.get_env("VEX_API_KEY_ID")
    vex_api_secret = System.get_env("VEX_API_SECRET")
    room_id = System.get_env("VEX_ROOM_ID")

    claims = %{
      "action" => "join",
      "room_id" => room_id
    }

    signer =
      Joken.Signer.create(
        "HS256",
        vex_api_secret,
        %{"api_key_id" => vex_api_key_id}
      )

    {:ok, jwt} = Joken.Signer.sign(claims, signer)

    render(conn, "index.html", jwt: jwt, room_id: room_id)
  end
end
