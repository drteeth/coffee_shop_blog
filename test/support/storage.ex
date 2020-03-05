defmodule CoffeeShop.Storage do
  @doc """
  Reset the event store and read store databases.
  """
  def reset! do
    :ok = Application.stop(:coffee_shop)

    reset_eventstore!()

    # reset_readstore!() # This will come in handy once we add a readstore

    {:ok, _} = Application.ensure_all_started(:coffee_shop)
  end

  defp reset_eventstore! do
    {:ok, conn} =
      CoffeeShop.EventStore.config()
      |> EventStore.Config.default_postgrex_opts()
      |> Postgrex.start_link()

    EventStore.Storage.Initializer.reset!(conn)
  end

  defp reset_readstore! do
    readstore_config = Application.get_env(:coffee_shop, CoffeeShop.Repo)

    {:ok, conn} = Postgrex.start_link(readstore_config)

    Postgrex.query!(conn, truncate_readstore_tables(), [])
  end

  defp truncate_readstore_tables do
    """
    TRUNCATE TABLE
      projection_versions
    RESTART IDENTITY;
    """
  end
end
