require 'rspec/expectations'

RSpec::Matchers.define :display_balance_of do |expected|
  match do |element|
    element.should have_content(expected)
  end

  failure_message_for_should do |actual|
    "expected element to have balance of #{expected} but was #{actual.text}"
  end
end
