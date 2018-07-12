require './util'

chain = get_chain
last_block = chain['blocks'].last
# get the last created proof
last_proof = last_block['proof']

# our proof
x = 0

# we will know x is a good proof hash.end_with? "000"
hash = hash_string ("#{last_proof}#{x}")

# keep trying different values for x until we find a matching proof


# send the newly minted block
block = {
    :previous_hash => (hash_object last_block),
    :proof => x,
    :recipient => 'jumblesale',
}

post_data block
