defmodule BankAPI.Accounts.Supervisor do
  use Supervisor

  def start_link do
    Supervisor.start_link(__MODULE__, nil)
  end

  def init(_arg) do
    children = [
      worker(BankAPI.Accounts.Projectors.AccountOpened, [], id: :account_opened)
    ]

    supervise(children, strategy: :one_for_one)
  end

end
