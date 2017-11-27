defmodule Go do
  use Application

  def start(_type, _args) do
    Go.Supervisor.start_link
  end
end
