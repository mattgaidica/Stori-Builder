class CreateEntities < ActiveRecord::Migration[5.2]
  def change
    create_table :entities do |t|
      t.string :content
      t.string :has_type

      t.timestamps
    end
  end
end
