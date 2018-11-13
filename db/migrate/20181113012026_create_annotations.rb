class CreateAnnotations < ActiveRecord::Migration[5.2]
  def change
    create_table :annotations do |t|
      t.text :body
      t.references :source, foreign_key: true

      t.timestamps
    end
  end
end
