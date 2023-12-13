class CreateLogs < ActiveRecord::Migration[7.0]
  def change
    create_table :logs do |t|
      t.string :action
      t.integer :post
      t.integer :author

      t.timestamps
    end
  end
end
