require './util'


def validate_chain(chain)
  previous_hash = nil
  chain_is_valid = true
  chain['blocks'].each do |block|
    expected = block["previous_hash"]
    actual = previous_hash
    p "expected #{expected}"
    p "computed #{actual}"
    if expected != actual
      p "hash is invalid"
      chain_is_valid = false
      p "invalid block is:"
      puts block
    else
      p "hash is valid"
    end
    previous_hash = hash_object block
  end

  chain_is_valid
end

valid = validate_chain get_chain

if valid
  p "chain is valid"
else
  p "chain is invalid"
end
