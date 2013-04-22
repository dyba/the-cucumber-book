class InsufficientFundsException < Exception
end

class Teller
  # The Teller object needs to call methods on the CashSlot
  # object so the Teller object can put (read #dispense)
  # money in the cash slot.
  def initialize(cash_slot)
    @cash_slot = cash_slot
  end

  def withdraw_from(account, amount)
    if (account.balance - amount) >= 0
      account.debit(amount)
      @cash_slot.dispense(amount)
    else
      raise InsufficientFundsException, "You have insufficient funds!"
    end
  end
end
