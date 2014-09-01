class CreateMobileApps < ActiveRecord::Migration
  def change
    create_table :mobile_apps do |t|
      t.string :name

      t.timestamps
    end
  end
end
