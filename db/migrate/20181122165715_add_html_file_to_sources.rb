class AddHtmlFileToSources < ActiveRecord::Migration[5.2]
  def change
    add_column :sources, :html_file, :string, unique: true
    add_column :sources, :pdf_link, :string
    add_column :sources, :authors, :string
  end
end
