class CreateFileErrors < ActiveRecord::Migration[5.2]
  def change
    create_table :file_errors do |t|
      t.string :contact_info
      t.string :message
      t.references :contact_file, foreign_key: true

      t.timestamps
    end
  end
end
