topic = Topic.create!(topic: "Political")

# Real trump account

trump = TwitterHandle.create!(
  topic: topic,
  twitter_handle: "realdonaldtrump"
)

# All fake trump account

TwitterHandle.create!(
  topic: topic,
  twitter_handle: "thefaketrump",
  real_twitter_handle_id: trump.id
)

TwitterHandle.create!(
  topic: topic,
  twitter_handle: "mechanicaltrump",
  real_twitter_handle_id: trump.id
)

TwitterHandle.create!(
  topic: topic,
  twitter_handle: "realdonaldtromp",
  real_twitter_handle_id: trump.id
)

TwitterHandle.create!(
  topic: topic,
  twitter_handle: "donnytrumpy",
  real_twitter_handle_id: trump.id
)

# Real Hillary

hillary = TwitterHandle.create!(
  topic: topic,
  twitter_handle: "hillaryclinton"
)

# Fake Hillary

TwitterHandle.create!(
  topic: topic,
  twitter_handle: "hilliaryclinton",
  real_twitter_handle_id: hillary.id
)

# Real Bill

bill = TwitterHandle.create!(
  topic: topic,
  twitter_handle: "billclinton"
)

# Fake Bill

TwitterHandle.create!(
  topic: topic,
  twitter_handle: "notbillclinton",
  real_twitter_handle_id: bill.id
)

# Real Bernie

bernie = TwitterHandle.create!(
  topic: topic,
  twitter_handle: "berniesanders"
)

# Fake Bernie

TwitterHandle.create!(
  topic: topic,
  twitter_handle: "berniethoughts",
  real_twitter_handle_id: bernie.id
)
