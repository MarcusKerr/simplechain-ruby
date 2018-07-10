require './util'


chain = get_chain
last_block = chain['blocks'].last

new_block = {
    :previous_hash => (hash_object last_block),
    :message => 'jumblesale'
}

post_data(new_block)
