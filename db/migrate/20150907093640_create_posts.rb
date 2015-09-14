class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.belongs_to :user, index: true, null: false

      t.string :content, null: false

      t.timestamps null: false
    end
  end
end
