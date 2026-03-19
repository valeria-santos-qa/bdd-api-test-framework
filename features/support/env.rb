require 'rspec/expectations'
require 'json_matchers/rspec'


JsonMatchers.schema_root = File.join(Dir.pwd, 'features/support/schemas/posts_api_schemas')

BASE_URL = "https://jsonplaceholder.typicode.com"

