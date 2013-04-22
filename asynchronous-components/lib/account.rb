require_relative 'transaction_queue'
require_relative 'balance_store'

class Account
  def initialize
    @queue = TransactionQueue.new
    @balance_store = BalanceStore.new
    @balance_store.balance = 0
  end

  def balance
    @balance_store.balance
  end

  def credit(amount)
    @queue.write("+#{amount}")
  end

  def debit(amount)
    @queue.write("-#{amount}")
  end
end
