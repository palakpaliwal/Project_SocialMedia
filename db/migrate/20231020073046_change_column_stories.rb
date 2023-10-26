class ChangeColumnStories < ActiveRecord::Migration[7.0]
  def change
      remove_column :stories ,:expires_at
  end
end
