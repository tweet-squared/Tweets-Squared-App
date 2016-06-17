topic = Topic.create!(topic: "news")

# Real / verified accounts
cnn = TwitterHandle.create!(topic: topic, twitter_handle: "cnnbrk")
bbc = TwitterHandle.create!(topic: topic, twitter_handle: "bbcsport")
onion = TwitterHandle.create!(topic: topic, twitter_handle: "theonion")


# Parody accounts
TwitterHandle.create!(topic: topic, twitter_handle: "thefakecnn", real_twitter_handle: cnn)
TwitterHandle.create!(topic: topic, twitter_handle: "bbcsporf", real_twitter_handle: bbc)
TwitterHandle.create!(topic: topic, twitter_handle: "theon1on", real_twitter_handle: onion)
