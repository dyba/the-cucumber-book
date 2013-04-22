When /^I prompt the teller to withdraw (#{CASH_AMOUNT}) from my account$/ do |amount|
  teller.withdraw_from(account, amount)
end

When /^I check my balance$/ do
  teller.check_balance(account)
end
