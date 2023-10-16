class ChangeColumnStories < ActiveRecord::Migration[7.0]
  def change
    
    change_column :stories ,:expires_at, :datetime ,  default: Time.now + 24.hours
  end
end
