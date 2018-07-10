require 'net/http'
require 'digest'
require 'json'


BASE_URL = 'jumblesale.localhost.run'
POST_BLOCK_URL = "http://#{BASE_URL}/block"

# @return [Object]
def get_chain
  response = JSON.load Net::HTTP.get(BASE_URL, '/chain')
  p "request to #{BASE_URL} received:"
  pp  response
  response
end

def post_data(data)
  uri = URI.parse(POST_BLOCK_URL)
  http = Net::HTTP.new(uri.host, uri.port)
  request = Net::HTTP::Post.new(uri.path, 'Content-Type' => 'application/json')
  request.body = data.to_json
  response = http.request(request)
  if response.code != '201'
    p "POSTing data to #{POST_BLOCK_URL} failed with errors:"
    puts (JSON.load response.read_body)['errors']
    false
  else
    p "successfully created a new block!"
    true
  end
end

# @return [string]
def hash_object(object)
  # sort the keys to ensure the chain is always hashed in the same way
  object = object.sort.to_h
  hash_string JSON.dump object
end

# @return [string]
def hash_string(string)
  Digest::SHA256.hexdigest string
end
