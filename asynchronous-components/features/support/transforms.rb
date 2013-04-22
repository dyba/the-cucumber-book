CASH_AMOUNT = Transform /^\$(\d+)$/ do |amount|
  amount.to_i
end
