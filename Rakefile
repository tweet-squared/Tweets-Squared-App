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

namespace :generate do
  require_relative "config/environment"
  desc 'Generates numbered tweets for every TwitterHandle in the database'
  task :tweets do
    TwitterHandle.all.each do |handle|
      12.times do |number|
        handle.tweets.create(content: "@#{handle.twitter_handle} tweet ##{number}")
      end
    end
  end
end
