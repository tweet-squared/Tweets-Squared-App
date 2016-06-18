# Homepage (Root path)
get '/' do
  @topics = Topic.all.order(:topic)
  erb :'/topics/index'
end



