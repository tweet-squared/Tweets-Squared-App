topic = Topic.create!(topic: "Companies")

# Real / verified accounts
starbucks = TwitterHandle.create!(topic_id: topic.id, twitter_handle: "starbucks")
netflix = TwitterHandle.create!(topic_id: topic.id, twitter_handle: "netflix")
burlington = TwitterHandle.create!(topic_id: topic.id, twitter_handle: "burlington")
pinterest = TwitterHandle.create!(topic_id: topic.id, twitter_handle: "pinterest")
bp = TwitterHandle.create!(topic_id: topic.id, twitter_handle: "bp_america")

# Parody accounts
TwitterHandle.create!(topic_id: topic.id, twitter_handle: "fakestarbucks", real_twitter_handle_id: starbucks.id)
TwitterHandle.create!(topic_id: topic.id, twitter_handle: "netflixlife", real_twitter_handle_id: netflix.id)
TwitterHandle.create!(topic_id: topic.id, twitter_handle: "notcoatfactory", real_twitter_handle_id: burlington.id)
TwitterHandle.create!(topic_id: topic.id, twitter_handle: "pinterestfake", real_twitter_handle_id: pinterest.id)
TwitterHandle.create!(topic_id: topic.id, twitter_handle: "bpcares", real_twitter_handle_id: bp.id)
