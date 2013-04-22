Then /^I should see that my balance is (#{CASH_AMOUNT})$/ do |amount|
  balance_tag.should display_balance_of(amount)
end
