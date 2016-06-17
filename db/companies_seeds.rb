topic = Topic.create!(topic: "companies")

# Real / verified accounts
starbucks = TwitterHandle.create!(twitter_handle: "starbucks")
netflix = TwitterHandle.create!(twitter_handle: "netflix")
burlington = TwitterHandle.create!(twitter_handle: "burlington")
pinterest = TwitterHandle.create!(twitter_handle: "pinterest")
bp = TwitterHandle.create!(twitter_handle: "bp_america")

# Parody accounts
TwitterHandle.create!(twitter_handle: "fakestarbucks", real_twitter_handle_id: starbucks.id)
TwitterHandle.create!(twitter_handle: "netflixlife", real_twitter_handle_id: netflix.id)
TwitterHandle.create!(twitter_handle: "notcoatfactory", real_twitter_handle_id: burlington.id)
TwitterHandle.create!(twitter_handle: "pinterestfake", real_twitter_handle_id: pinterest.id)
TwitterHandle.create!(twitter_handle: "bpcares", real_twitter_handle_id: bp.id)
