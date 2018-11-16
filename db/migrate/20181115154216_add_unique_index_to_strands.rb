class AddUniqueIndexToStrands < ActiveRecord::Migration[5.2]
  def change
    add_index :strands, [:annotation_id, :thought_id], unique: true
  end
end
