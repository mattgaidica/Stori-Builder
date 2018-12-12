class CreateAcronyms < ActiveRecord::Migration[5.2]
  def change
    create_table :acronyms do |t|
      t.string :term
      t.boolean :is_master, default: false
      t.integer :like_id

      t.timestamps
    end
    add_index :acronyms, :term, unique: true
  end
end
