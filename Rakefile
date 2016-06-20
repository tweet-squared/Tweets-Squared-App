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

namespace :twitter do
  require 'dotenv/tasks'
  require 'twitter'

  desc 'Load Twitter config parameters as environment variables from Dotenv'
  task :dotenv => :get_env do
    @TWITTER_ENV = Dotenv.load.select { |key, _| key.match(/TWITTER/) }
    @TWITTER_ENV.merge!(ENV.select { |key,_| key.match(/TWITTER/) })
  end

  desc 'Configure Twitter client'
  task :client_config => :dotenv do
    config = {
      consumer_key: @TWITTER_ENV['TWITTER_CONSUMER_KEY'],
      consumer_secret: @TWITTER_ENV['TWITTER_CONSUMER_SECRET']
    }
    @twitter_client = Twitter::REST::Client.new(config)
  end

  # Import tweets for all TwitterHandles and add them to the Tweets table
  desc 'Pull Tweets'
  task :pull_tweets => :client_config do
    # Clear the Tweets table before populating
    Tweet.destroy_all

    TwitterHandle.all.each do |listing|
      handle = listing.twitter_handle
      user_tweets = @twitter_client.user_timeline("#{handle}")
      user_tweets.each do |tweet|
        listing.tweets.create(content: tweet.full_text, media_url: tweet.media.count > 0 ? tweet.media.sample.media_url.to_s : nil)
      end
    end
  end

  # Import 200 tweets for each TwitterHandle and add them to the Tweets table
  desc 'Pull 200 tweets for each account listed'
  task :pull_200_tweets => :client_config do
    # Clear the Tweets table before populating
    Tweet.destroy_all

    begin
      TwitterHandle.all.each do |listing|
        handle = listing.twitter_handle
        user_tweets = @twitter_client.user_timeline("#{handle}", {count: 200})
        user_tweets.each do |tweet|
          listing.tweets.create(content: tweet.full_text, media_url: tweet.media.count > 0 ? tweet.media.sample.media_url.to_s : nil)
        end
      end
    rescue Twitter::Error::TooManyRequests => error
      sleep error.rate_limit.reset_in + 1
    end
  end

  # Import up to 3200 tweets (the maximum allowed) for each TwitterHandle and add them to the Tweets table
  desc 'Pull 3200 tweets for each account listed'
  task :pull_3200_tweets => :client_config do
    # Clear the Tweets table before populating
    Tweet.destroy_all

    # Helper methods
    def collect_with_max_id(collection=[], max_id=nil, &block)
      response = yield(max_id)
      collection += response
      response.empty? ? collection.flatten : collect_with_max_id(collection, response.last.id - 1, &block)
    end

    def @twitter_client.get_all_tweets(user)
      collect_with_max_id do |max_id|
        options = {count: 200, include_rts: true}
        options[:max_id] = max_id unless max_id.nil?
        begin
        user_timeline(user, options)
        rescue Twitter::Error::TooManyRequests => error
          puts "sleeping until #{error.rate_limit.reset_in + 1} due to TooManyRequests"
          sleep error.rate_limit.reset_in + 1
          retry
        end
      end
    end

    # Loop through all TwitterHandles and get the maximum number of tweets
    TwitterHandle.all.each do |listing|
      handle = listing.twitter_handle
      @twitter_client.get_all_tweets("#{handle}").each do |tweet|
        listing.tweets.create(content: tweet.full_text, media_url: tweet.media.count > 0 ? tweet.media.sample.media_url.to_s : nil)
      end
    end
  end
end
