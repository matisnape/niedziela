class ChangeFilesTable < ActiveRecord::Migration[5.2]
  def change
    change_table :scrape_files do |t|
      t.remove :content_type
      t.rename :file_contents, :dates_list
    end
    change_column :scrape_files, :dates_list
  end
end
