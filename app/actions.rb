# Homepage (Root path)
get '/' do
  erb :index
end

get '/topics/:id' do |id|
  @topics = Topic.all
  unless id == "all"
    @topics = [Topic.find(id)]
  end
  @real = @topics.sample.twitter_handles.where("real_twitter_handle_id is null").sample.tweets.sample
  @fake = TwitterHandle.where("real_twitter_handle_id = ?", [@real.twitter_handle.id]).sample.tweets.sample
  erb :'topics/show.html'
end
