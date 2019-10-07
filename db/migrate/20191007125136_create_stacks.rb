class CreateStacks < ActiveRecord::Migration[5.2]
  def change
    create_table :stacks do |t|
      t.string :name
      t.boolean :pref_annotations_showsource, :null => false, :default => false
      t.string :pref_settings_importpath

      t.timestamps
    end
  end
end
