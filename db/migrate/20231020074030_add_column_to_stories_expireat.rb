class AddColumnToStoriesExpireat < ActiveRecord::Migration[7.0]
  def change
    add_column :stories, :expires_at ,:datetime
  end
end
