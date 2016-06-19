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
  erb :'/topics/index.html'
end

get '/verify/:id' do |id|
  tweet = Tweet.find(id)
  session[:times] = (session[:times] || 0) + 1
  if tweet.twitter_handle.real_twitter_handle_id == nil
    session[:score] = (session[:score] || 0) + 1
  end
  redirect "/topics/#{session[:topic] || "all"}"
<<<<<<< 0cbf5b54c2dcba508397b7947e86ca09ac322d22
end

get '/topics/:id' do
  erb :'/topics/all.html'
=======
>>>>>>> Fix the merge conflicts issues
end