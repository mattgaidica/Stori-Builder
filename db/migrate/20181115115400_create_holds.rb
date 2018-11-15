class CreateHolds < ActiveRecord::Migration[5.2]
  def change
    create_table :holds do |t|
    	t.belongs_to :annotation, index: true
      t.timestamps
    end
  end
end
