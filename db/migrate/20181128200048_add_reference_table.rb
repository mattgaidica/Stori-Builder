class AddReferenceTable < ActiveRecord::Migration[5.2]
  def change
    create_table :citations do |t|
      t.string :cited_as
      t.boolean :is_read, default: false
      t.references :source
      t.timestamps
    end
  end
end
