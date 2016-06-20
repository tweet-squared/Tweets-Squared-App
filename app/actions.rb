# Homepage (Root path)
get '/' do
  redirect "/topics"
end

get '/topics/:name' do |name|
  @show_menu = true
  session[:topic] = name
  @topics = Topic.all
  unless name == "all"
    @topics = [Topic.find_by(topic: name)]
  end
  @real = @topics.sample.twitter_handles.where("real_twitter_handle_id is null").sample.tweets.sample
  @fake = TwitterHandle.where("real_twitter_handle_id = ?", [@real.twitter_handle.id]).sample.tweets.sample
  erb :'topics/show.html'
end

get '/topics' do
  @topics = Topic.all.order(:topic)
  erb :'/topics/index.html'
end

get '/verify/:id' do |id|
  tweet = Tweet.find(id)
  session[:times] = (session[:times] || 0) + 1
  if tweet.twitter_handle.real_twitter_handle_id == nil
    session[:score] = (session[:score] || 0) + 1
  end
  if session[:times] >= 10
    redirect "/game_over"
  else
    redirect "/topics/#{session[:topic] || "all"}"
  end
end

get '/game_over' do
  output = erb :'/game_over.html'
  session.clear
  output
end
