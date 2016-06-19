# Homepage (Root path)
get '/' do
  erb :index
end

get '/topics' do
  @topics = Topic.all.order(:topic)
  erb :'/topics/index.html'
end
