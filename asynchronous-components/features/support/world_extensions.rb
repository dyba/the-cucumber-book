module KnowsTheDomain
  class UserInterface
    include Capybara::DSL

    def withdraw_from(account, amount)
      Sinatra::Application.account = account
      visit "/withdraw_amount"
      fill_in "Amount", :with => amount
      click_button "Withdraw"
    end

    def check_balance(account)
      Sinatra::Application.account = account
      visit "/check_balance"
    end
  end

  def account
    @account ||= Account.new
    # Caching is the Devil's past-time - Chad Fowler
  end

  def cash_slot
    @cash_slot ||= Sinatra::Application.cash_slot #CashSlot.new
  end

  def teller
    @teller ||= UserInterface.new # Teller.new(cash_slot)
  end
end

World(KnowsTheDomain)
