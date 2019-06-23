class RenameColumnDatesList < ActiveRecord::Migration[5.2]
  def change
    rename_column :scrape_files, :dates_list, :dates
  end
end
