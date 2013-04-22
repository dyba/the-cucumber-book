When /^the client requests GET (.*)$/ do |path|
  @last_response = HTTParty.get("http://localhost:9999" + path)
end

When /^the client submits POST (.*) with the following fruit:$/ do |path, fruit|
  HTTParty.post("http://localhost:9999" + path,
                :body => { :fruit => fruit.hashes.to_json })
end

Then /^the response should be JSON:$/ do |json|
  JSON.parse(@last_response.body).should == JSON.parse(json)
end
