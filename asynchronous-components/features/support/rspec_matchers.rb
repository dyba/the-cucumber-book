require 'rspec/expectations'

RSpec::Matchers.define :display_balance_of do |expected|
  match do |element|
    element.should have_content(expected)
  end
end
