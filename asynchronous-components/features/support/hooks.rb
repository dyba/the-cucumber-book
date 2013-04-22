Before do
  BalanceStore.new.balance = 0
  TransactionQueue.clear
end

After do |scenario|
  save_and_open_page if scenario.failed?
end
