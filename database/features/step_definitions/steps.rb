Then /^I should be told that I have insufficient funds in my account$/ do
  page.should have_content("Sorry, you have insufficient funds in your account. :(")
end
