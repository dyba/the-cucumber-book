Given /^the system knows about the following fruit:$/ do |fruits|
  File.open('fruits.json', 'w') do |f|
    f.write(fruits.hashes.to_json)
  end
end
