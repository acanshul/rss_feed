namespace :feedReader do
  task reader: [:environment] do
    Feed.all.each do |feed|
      Feed.fetch_rss(feed)
    end
  end
end