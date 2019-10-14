class AddFindingToAnnotation < ActiveRecord::Migration[5.2]
  def change
  	add_column :annotations, :is_finding, :boolean, default: false
  end
end
