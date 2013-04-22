Then /^(#{CASH_AMOUNT}) should be dispensed$/ do |amount|
  cash_slot.contents.should == amount
end

Then /^nothing should be dispensed$/ do
  cash_slot.contents.should == 0
end
