# Homepage (Root path)
get '/' do
  @topics = Topic.all
  erb :'/topics/index'
end



