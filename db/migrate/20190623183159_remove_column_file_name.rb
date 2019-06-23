class RemoveColumnFileName < ActiveRecord::Migration[5.2]
  def change
    remove_column :scraped_dates, :file_name
  end
end
