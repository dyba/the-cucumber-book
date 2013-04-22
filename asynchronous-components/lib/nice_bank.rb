require 'sinatra'
require_relative 'cash_slot'
require_relative 'teller'
require_relative 'account'
require_relative 'utils'

include Utils

set :cash_slot, CashSlot.new
set :account do
  Account.new # fail "There is no account yet!"
end

get "/" do
  %{
    <html>
      <body>
        <a href="/check_balance">Check Balance</a><br/>
        <a href="/withdraw_amount">Withdraw Amount</a>
      </body>
    </html>
  }
end

get "/check_balance" do
  %{
    <html>
      <body>
        <span class="balance">#{when_stabilized { settings.account.balance }}</span>
        <br/>
        <a href="/">Main menu</a>
      </body>
    </html>
  }
end

get "/withdraw_amount" do
  %{
    <html>
      <body>
        <form action="/withdraw" method="post">
          <label for="amount">Amount</label>
          <input type="text" id="amount" name="amount">
          <button type="submit">Withdraw</button>
        </form>
      </body>
    </html>
  }
end

get "/overdrawn" do
  %{
    <html>
      <body>
        <span>Sorry, you have insufficient funds in your account. :(</span><br/>
        <a href="/">Main menu</a>
      </body>
    </html>
  }
end

post "/withdraw" do
  settings.cash_slot.clear
  teller = Teller.new(settings.cash_slot)
  begin
    teller.withdraw_from(settings.account, params[:amount].to_i)
  rescue InsufficientFundsException => error
    redirect to('/overdrawn')
  end
end
