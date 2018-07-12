require './util'

chain = get_chain
last_block = chain['blocks'].last
last_proof = last_block['proof']
proof = 0

(0..Float::INFINITY).each do |i|
  hash = hash_string ("#{last_proof}#{i}")
  p hash
  if hash.end_with? "000"
    proof = i
    break
  end
end

block = {
    :previous_hash => (hash_object last_block),
    :proof => proof,
    :recipient => 'jumblesale',
}

post_data block
