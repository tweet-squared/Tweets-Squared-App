topic = Topic.create!(topic: "News")

# Real / verified accounts
cnn = TwitterHandle.create!(topic: topic, twitter_handle: "cnnbrk")
bbc = TwitterHandle.create!(topic: topic, twitter_handle: "bbcsport")
onion = TwitterHandle.create!(topic: topic, twitter_handle: "theonion")


# Parody accounts
TwitterHandle.create!(topic: topic, twitter_handle: "thefakecnn", real_twitter_handle_id: cnn.id)
TwitterHandle.create!(topic: topic, twitter_handle: "bbcsporf", real_twitter_handle_id: bbc.id)
TwitterHandle.create!(topic: topic, twitter_handle: "theon1on", real_twitter_handle_id: onion.id)
