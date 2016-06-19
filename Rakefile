require "sinatra/activerecord/rake"

namespace :db do
  task :load_config do
    require ::File.expand_path('../config/environment', __FILE__)
  end

  desc 'Retrieves the current schema version number'
  task :version do
    puts "Current version: #{ActiveRecord::Migrator.current_version}"
  end
end

desc 'Global namespace that requires config/environment'
task :get_env do
  require_relative "config/environment"
end

namespace :generate do
  desc 'Generates numbered tweets for every TwitterHandle in the database'
  task :tweets => :get_env do
    Tweet.destroy_all
    TwitterHandle.all.each do |handle|
      12.times do |number|
        handle.tweets.create(content: "@#{handle.twitter_handle} tweet ##{number}")
      end
    end
  end
end
