class FeedEntriesController < ApplicationController

	before_action :set_feed, only: :index
  
  def index
  	@feed_entries = @feed.feed_entries.order('published desc')
  end

  def show
  	@feed_entry = FeedEntry.find(params[:id])
  end

  private

  def set_feed
    @feed = Feed.find(params[:id])
  end

end
