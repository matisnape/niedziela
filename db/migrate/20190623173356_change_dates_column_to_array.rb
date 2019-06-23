class ChangeDatesColumnToArray < ActiveRecord::Migration[5.2]
  def change
    change_column :scrape_files, :dates, "varchar[] USING dates::character varying[]"
  end
end
