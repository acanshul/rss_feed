require 'rss'
require 'open-uri'

class Feed < ActiveRecord::Base

  has_many :feed_entries, dependent: :destroy

  class << self
    def fetch_rss(feed)
      content = RSS::Parser.parse feed.url
      feed.name = content.channel.title
      feed.save
      content.items.each do |item|
        feed_entry = feed.feed_entries.where(title: item.title).first_or_initialize
        case content.feed_type
          when 'rss'
            feed_entry.update_attributes(content: item.description, url: item.link, published: item.pubDate)
          when 'atom'
            feed_entry.update_attributes(content: item.content, url: item.link, published: item.published)
        end
      end
    end
  end

end
