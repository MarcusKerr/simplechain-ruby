require './util'

# get the blockchain from the webservice
chain = get_chain
# find the last block in the list of blocks
last_block = chain['blocks'].last

# create a hash to hold our new block
new_block = {
    :previous_hash => 'hash of the last block goes here',
    :message => 'put a message in here to see it in the blockchain'
}

# send the block to the webservice
post_data(new_block)
