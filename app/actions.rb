# Homepage (Root path)
# redirects to topics landing page
get '/' do
  redirect '/topics'
end

get '/topics' do
  @topics = Topic.all.order(:topic)
  erb :'/topics/index'
end

get '/topics/:id' do 
  @topic = Topic.find(params[:id])
  erb :'topics/show'
end



