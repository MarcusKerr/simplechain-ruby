# the util module contains convenience methods for accessing the webservice and creating hashes
require './util'


# define a method to check if the chain is valid
def validate_chain(chain)
  # the chain is valid unless proved otherwise
  chain_is_valid = true

  # the chain has a list of blocks under the 'blocks' key
  chain['blocks'].each do |block|
    # for each block, check if the value of block['previous_hash'] has the expected value
  end

  # return the valid state of the chain
  chain_is_valid
end

# retrieve the chain from the webservice
chain = get_chain

# validate it
valid = validate_chain chain

if valid
  p "chain is valid"
else
  p "chain is invalid"
end
