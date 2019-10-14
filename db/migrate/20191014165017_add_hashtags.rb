class AddHashtags < ActiveRecord::Migration[5.2]
  def change
  	create_table :hashtags do |t|
      t.string :content

      t.timestamps
    end

  	create_join_table :hashtags, :sources do |t|
      t.index [:hashtag_id, :source_id]
    end
  end
end
