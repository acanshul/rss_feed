class RssReaderJob < ActiveJob::Base
  queue_as :default

  def perform(feed)
    # Do later
    Feed.fetch_rss(feed)
  end

end
