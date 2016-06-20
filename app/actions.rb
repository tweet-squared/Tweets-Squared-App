# Homepage (Root path)
get '/' do
  redirect "/topics"
end

get '/topics/:id' do |id|
  session[:topic] = id
  @topics = Topic.all
  unless id == "all"
    @topics = [Topic.find(id)]
  end
  @real = @topics.sample.twitter_handles.where("real_twitter_handle_id is null").sample.tweets.sample
  @fake = TwitterHandle.where("real_twitter_handle_id = ?", [@real.twitter_handle.id]).sample.tweets.sample
  if params['json'].nil?
    erb :'topics/show.html'
  else
    {
      real: @real.content,
      fake: @fake.content,
      topic: id,
      real_handle: @real.twitter_handle.twitter_handle,
      fake_handle: @fake.twitter_handle.twitter_handle,
      tweet_topic: @real.twitter_handle.topic.topic,
    }.to_json
  end
end

get '/topics' do
  @topics = Topic.all.order(:topic)
  if params['json'].nil?
    erb :'/topics/index.html'
  else
    Topic.all.to_a.to_json
  end
end

get '/verify/:id' do |id|
  tweet = Tweet.find(id)
  session[:times] = (session[:times] || 0) + 1
  if tweet.twitter_handle.real_twitter_handle_id == nil
    session[:score] = (session[:score] || 0) + 1
  end
  redirect "/topics/#{session[:topic] || "all"}"
end
