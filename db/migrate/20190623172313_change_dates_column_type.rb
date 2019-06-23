class ChangeDatesColumnType < ActiveRecord::Migration[5.2]
  def change
    change_column :scrape_files, :dates, :string
  end
end
