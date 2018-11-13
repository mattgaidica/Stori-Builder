class CreateStrands < ActiveRecord::Migration[5.2]
  def change
    create_table :strands do |t|
      t.integer :position
      t.belongs_to :thought, index: true
      t.belongs_to :annotation, index: true
      t.timestamps
    end
  end
end
