Given /^I am credited (#{CASH_AMOUNT}) in my account$/ do |amount|
  account.credit(amount)
  eventually { account.reload.balance.should eq(amount) }
end

Given /^my account has been credited with (#{CASH_AMOUNT})$/ do |amount|
  account.credit(amount)
  eventually { account.reload.balance.should eq(amount) }
end

Then /^the balance of my account should be (#{CASH_AMOUNT})$/ do |amount|
  eventually { account.reload.balance.should == amount }
end
