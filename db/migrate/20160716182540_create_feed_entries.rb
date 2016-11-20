class CreateFeedEntries < ActiveRecord::Migration
  def change
    create_table :feed_entries do |t|
      t.string :title
      t.datetime :published
      t.text :content
      t.string :url
      t.string :author
      t.integer :feed_id

      t.timestamps null: false
    end
  end
end
