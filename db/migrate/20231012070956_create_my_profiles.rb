class CreateMyProfiles < ActiveRecord::Migration[7.0]
  def change
    create_table :my_profiles do |t|
       
      t.belongs_to :user
      
      t.timestamps
    end
  end
end
