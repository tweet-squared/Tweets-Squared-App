topic = Topic.create!(topic: "news")

# Real / verified accounts
cnn = TwitterHandle.create!(topic_id: topic.id, twitter_handle: "cnnbrk")
bbc = TwitterHandle.create!(topic_id: topic.id, twitter_handle: "bbcsport")
onion = TwitterHandle.create!(topic_id: topic.id, twitter_handle: "theonion")


# Parody accounts
TwitterHandle.create!(topic_id: topic.id, twitter_handle: "thefakecnn", real_twitter_handle_id: cnn.id)
TwitterHandle.create!(topic_id: topic.id, twitter_handle: "bbcsporf", real_twitter_handle_id: bbc.id)
TwitterHandle.create!(topic_id: topic.id, twitter_handle: "theon1on", real_twitter_handle_id: onion.id)
