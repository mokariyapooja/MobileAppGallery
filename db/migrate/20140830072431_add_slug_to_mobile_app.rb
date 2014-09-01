class AddSlugToMobileApp < ActiveRecord::Migration
  def change
    add_column :mobile_apps, :slug, :string
    add_index :mobile_apps, :slug    
  end
end
