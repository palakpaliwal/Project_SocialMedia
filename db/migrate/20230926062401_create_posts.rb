class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|

      t.datetime :time
      t.string :content
      t.belongs_to :users

      t.timestamps
    end
  end
end
