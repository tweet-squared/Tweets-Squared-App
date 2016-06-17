topic = Topic.create!(
topic: "Celebrities")

#######################
# ELLEN DEGENERES
# Real
real_ellen_degeneres = TwitterHandle.create!(
twitter_handle: "theellenshow",
topic: topic)

# Fake
fake_ellen_degeneres = TwitterHandle.create!(
twitter_handle: "ellenreaction",
real_twitter_handle_id: real_ellen_degeneres.id,
topic: topic)

#######################
# ELON MUSK
# Real
real_elon_musk = TwitterHandle.create!(
twitter_handle: "elonmusk",
topic: topic)

# Fake
fake_elon_musk = TwitterHandle.create!(
twitter_handle: "boredelonmusk",
real_twitter_handle_id: real_elon_musk.id,
topic: topic)

#######################
# QUEEN ELIZABETH
# Real
real_queen_elizabeth = TwitterHandle.create!(
twitter_handle: "royalfamily",
topic: topic)

# Fake
fake_queen_elizabeth = TwitterHandle.create!(
twitter_handle: "queen_uk",
real_twitter_handle_id: real_queen_elizabeth.id,
topic: topic)

#######################
# DAVID KARP
# Real
real_david_karp = TwitterHandle.create!(
twitter_handle: "davidkarp",
topic: topic)

# Fake
fake_david_karp = TwitterHandle.create!(
twitter_handle: "davidkrap",
real_twitter_handle_id: real_david_karp.id,
topic: topic)

#######################
# TAYLOR SWIFT
# Real
real_taylor_swift = TwitterHandle.create!(
twitter_handle: "taylorswift13",
topic: topic)

# Fake
fake_taylor_swift = TwitterHandle.create!(
twitter_handle: "feministtswift",
real_twitter_handle_id: real_taylor_swift.id,
topic: topic)

#######################
# KANYE WEST
# Real
real_kanye_west = TwitterHandle.create!(
twitter_handle: "kanyewest",
topic: topic)

# Fake
fake_kanye_west = TwitterHandle.create!(
twitter_handle: "kanyewestrants",
real_twitter_handle_id: real_kanye_west.id,
topic: topic)



