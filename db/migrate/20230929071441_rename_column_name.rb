class RenameColumnName < ActiveRecord::Migration[7.0]
  def change

    rename_column :comments, :content, :comments 
  end
end
