class CreateRatings < ActiveRecord::Migration[7.0]
  def change
    create_table :ratings do |t|
      t.integer :post, null: false
      t.integer :author, null: false
      t.boolean :upvote, null: false
  
      t.timestamps
    end
  end
end
