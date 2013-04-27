Given /^there is a User$/ do
  FactoryGirl.create(:user)
end

Given /^the user has posted a message "([^"]*)"$/ do |message_text|
  User.count.should eq(1)
  FactoryGirl.create(:message, :content => message_text, :user => User.first)
end

When /^I visit the page for the User$/ do
  User.count.should eq(1)
  visit(user_path(User.first))
end

Then /^I should see "([^"]*)"$/ do |message_text|
  page.should have_content(message_text)
end
