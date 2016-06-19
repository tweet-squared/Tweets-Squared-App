# Homepage (Root path)
get '/' do
  erb :index
end

get '/verify/:id' do
  tweet = Tweet.find(id)
  session[:times] = (session[:times] || 0) + 1
  if tweet.twitter_handle.real_twitter_handle_id == nil
    session[:score] = (session[:score] || 0) + 1
  end
  redirect '/topics/#{tweet.twitter_handle.topic.id}'
end
