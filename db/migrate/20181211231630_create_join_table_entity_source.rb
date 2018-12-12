class CreateJoinTableEntitySource < ActiveRecord::Migration[5.2]
  def change
    create_join_table :entities, :sources do |t|
      t.index [:entity_id, :source_id]
    end
  end
end
