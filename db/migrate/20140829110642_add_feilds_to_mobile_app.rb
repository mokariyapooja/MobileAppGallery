class AddFeildsToMobileApp < ActiveRecord::Migration
  def change
     add_column :mobile_apps, :email,             :string
     add_column :mobile_apps, :Selling_Price,     :string
     add_column :mobile_apps, :Category,          :string
     add_column :mobile_apps, :Android_App_URL,   :string
     add_column :mobile_apps, :Keywords,          :string
     add_column :mobile_apps, :Long_Description,  :string
     add_column :mobile_apps, :Screen_Shots,      :string
     
  end
end
