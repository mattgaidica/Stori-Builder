class AddBodySourceToAnnotations < ActiveRecord::Migration[5.2]
  def change
    add_column :annotations, :body_source, :string
    add_column :annotations, :is_summary, :boolean
  end
end
