class AddExtraColumnToPosts < ActiveRecord::Migration[7.0]
  def change
    add_column :posts, :post_name, :string
  end
end
