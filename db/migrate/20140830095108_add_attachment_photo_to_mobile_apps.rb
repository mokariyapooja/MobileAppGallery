class AddAttachmentPhotoToMobileApps < ActiveRecord::Migration
  def self.up
    change_table :mobile_apps do |t|
      t.attachment :photo
    end
  end

  def self.down
    remove_attachment :mobile_apps, :photo
  end
end
