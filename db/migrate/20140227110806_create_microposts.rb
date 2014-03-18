class CreateMicroposts < ActiveRecord::Migration
  def change
    create_table :microposts do |t|
      t.integer :user_id
      t.string :nickname
      t.string :image
      t.text :post
      t.datetime :post_date

      t.timestamps
    end
  end
end
