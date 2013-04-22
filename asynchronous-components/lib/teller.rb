require_relative 'utils'

class InsufficientFundsException < Exception
end

class Teller
  include Utils

  # The Teller object needs to call methods on the CashSlot
  # object so the Teller object can put (read #dispense)
  # money in the cash slot.
  def initialize(cash_slot)
    @cash_slot = cash_slot
  end

  def withdraw_from(account, amount)
    # account.debit(amount)
    #
    # sleep 2 # How do you fix this?! I want to remove this
    # If the balance has not been updated in between polls
    # lasting 0.2 seconds, retrieve the balance
    if when_stabilized { account.balance } - amount >= 0
      account.debit(amount)
      @cash_slot.dispense(amount)
    else
      raise InsufficientFundsException, "You have insufficient funds!"
    end
  end
end
