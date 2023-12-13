class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.string :title
      t.text :body
      t.boolean :anonimity
      t.integer :author
      t.integer :parent

      t.timestamps
    end
  end
end
