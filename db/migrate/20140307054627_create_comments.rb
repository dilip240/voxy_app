class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :comment
      t.integer :micropost_id
      t.string :name
      t.integer :user_id
      t.string :nickname
      t.datetime :date

      t.timestamps
    end
  end
end
