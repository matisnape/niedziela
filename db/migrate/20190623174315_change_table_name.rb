class ChangeTableName < ActiveRecord::Migration[5.2]
  def change
    rename_table :scrape_files, :scraped_dates
  end
end
