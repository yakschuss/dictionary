defmodule Procs do
  def greeter(count) do
    receive do
      { :boom, reason } ->
        exit(reason)
      { :add, n } ->
        IO.puts "count: #{count}"
        greeter(count + n)
      { :reset } ->
        greeter(0)
      msg ->
        IO.puts "#{count}: Inspect #{inspect msg}"
        greeter(count)
    end
  end
end
