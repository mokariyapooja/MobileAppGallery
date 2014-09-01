class RemoveFieldNameFromTableName < ActiveRecord::Migration
  def change
    remove_column :mobile_apps, :Screen_Shots,             :string
  end
end
