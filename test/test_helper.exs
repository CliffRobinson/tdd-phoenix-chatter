{:ok, _} = Application.ensure_all_started(:wallaby)
ExUnit.start()
Ecto.Adapters.SQL.Sandbox.mode(Chatter.Repo, :manual)
Application.put_env(:wallaby, :base_url, ChatterWeb.Endpoint.url())