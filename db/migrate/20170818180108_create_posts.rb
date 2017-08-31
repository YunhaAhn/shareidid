class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
  
      t.integer :category_id 
      # t.integer :user_id
      
      t.text :content
      t.string :title
      # t.string :email
      t.timestamps null: false
    end
  end
end
