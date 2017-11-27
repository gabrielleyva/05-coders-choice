defmodule Go.TcpServer do
  use GenServer

  def start_link() do
    ip = Application.get_env :tcp_server, :ip, {127,0,0,1}
    port = Application.get_env :tcp_server, :port, 4000
    GenServer.start_link(__MODULE__,[ip, port],[])
  end

  def init [ip,port] do
    {:ok,listen_socket}= :gen_tcp.listen(port,[:binary,{:packet, 0},{:active,true},{:ip,ip}])
    {:ok,socket } = :gen_tcp.accept listen_socket
    {:ok, %{ip: ip,port: port,socket: socket}}
  end

  # def add_message(msg) do
  #   GenServer.cast(:chat_room, {:add_message, msg})
  # end
  #
  # def handle_call(:get_messages, _from, msgs) do
  #   {:reply, msgs, msgs}
  # end
  #
  # def handle_cast({:add_message, msg}, msgs) do
  #   {:no_reply, [msg | msgs]}
  # end

  defp serve(socket) do
    socket
    |> read_line()
    |> write_line(socket)
  end

  defp read_line(socket) do
    {:ok, data} = :gen_tcp.recv(socket, 0)
    data
  end

  defp write_line(line, socket) do
    :gen_tcp.send(socket, line)
  end

  def handle_info({:tcp, socket, packet}, state) do
    #serve(socket)
    :gen_tcp.send socket, "is Going Out! \n"
    {:noreply, state}
  end

  def handle_info({:tcp_closed,socket}, state) do
    {:noreply,state}
  end

  def handle_info({:tcp_error, socket, reason}, state) do
    {:noreply,state}
  end

end
