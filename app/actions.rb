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
  erb :'topics/show.html'
end

get '/topics' do
  @topics = Topic.all.order(:topic)
  unless params['json']
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
