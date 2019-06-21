class CreateFiles < ActiveRecord::Migration[5.2]
  def change
    create_table :scrape_files do |t|
      t.string :file_name, null: false
      t.string :content_type
      t.binary :file_contents

      t.timestamps
    end

    add_index :scrape_files, :file_name, unique: true
  end
end
