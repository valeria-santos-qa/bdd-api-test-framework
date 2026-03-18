require 'httparty'
require 'rspec'

When('I send a GET request to {string}') do |endpoint|
  
    @response = HTTParty.get("#{BASE_URL}/#{endpoint}")
    log("<details><summary>View response body</summary><b><br>Returned Status Code: #{@response.code}</b><pre>#{@response.body}</pre></details>")

end

Then('the response status should be {int}') do |status_code|
    expect(@response.code).to eq(status_code)


end

Then('the response should contain a list of posts') do
    body = JSON.parse(@response.body)
    expect(body).to be_an(Array)
end



Then('the response should contain a post with id {int}') do |expected_id|
  
    

end


When('I send a GET request to {string} with a valid id') do |endpoint|
  @id = 1
  @response = HTTParty.get("#{BASE_URL}/posts/#{@id}")
  log("<details><summary>View response body</summary><b><br>Returned Status Code: #{@response.code}</b><pre>#{@response.body}</pre></details>")

end

Then('the response should contain a post with id') do
    parsed = JSON.parse(@response.body)

    expect(parsed["id"]).to eq(@id)
end

Then('the response should contain a post with {int}') do |expected_id|
    parsed = JSON.parse(@response.body)

    expect(parsed["id"]).to eq(expected_id)
end

Then('the response should contain a post with title {string}') do |expected_field_title|
    parsed = JSON.parse(@response.body)

    expect(parsed["title"]).to eq(expected_field_title)
end


Then('the response should contain a post with body:') do |expected_post_body|
    parsed = JSON.parse(@response.body)

    expect(parsed["body"]).to eq(expected_post_body)
end