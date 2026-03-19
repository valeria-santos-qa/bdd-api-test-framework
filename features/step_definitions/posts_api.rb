require 'httparty'
require 'rspec'

def validate_post_body(expected_post_body)
  parsed = JSON.parse(@response.body)
  expect(parsed["body"]).to eq(expected_post_body)
end

When('I send a GET request to {string}') do |endpoint|
  @response = HTTParty.get("#{BASE_URL}#{endpoint}")
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
  parsed = JSON.parse(@response.body)
  expect(parsed["id"]).to eq(expected_id)
end

When('I send a GET request to {string} with a valid id') do |endpoint|
  @id = 1
  @url = "#{BASE_URL}/posts/#{@id}"
  @response = HTTParty.get(@url)

  log("<details><summary>View response body</summary><b><br>Returned Status Code: #{@response.code}</b><pre>#{@response.body}</pre></details>")
end

Then('the response should contain a post with title {string}') do |expected_field_title|
  parsed = JSON.parse(@response.body)
  expect(parsed["title"]).to eq(expected_field_title)
end

# Step para string literal
Then('the response should contain a post with body {string}') do |expected_post_body|
  validate_post_body(expected_post_body)
end

# Step para doc string
Then('the response should contain a post with body:') do |expected_post_body|
  validate_post_body(expected_post_body)
end

When('I send a POST request to {string} with the following body:') do |endpoint, request_body|
  @url = "#{BASE_URL}/#{endpoint}"
  headers = { 'Content-Type' => 'application/json' }

  @response = HTTParty.post(@url,
    headers: headers,
    body: request_body
  )

end

Then('the response body should match the {string} schema') do |schema_name|
  expect(@response.body).to match_json_schema(schema_name)
end
