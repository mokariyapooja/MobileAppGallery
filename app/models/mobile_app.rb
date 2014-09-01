class MobileApp < ActiveRecord::Base
 
  #paperclip_attachment
  has_attached_file :photo, :styles => { :small => "150x150", :large => "320x240" },
                    :url  => "/assets/mobile_apps/:id/:style/:basename.:extension",
                    :path => ":rails_root/public/assets/mobile_apps/:id/:style/:basename.:extension"
                    
  #validations
  validates_attachment_content_type :photo, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]  
  validates_presence_of :name,:email,:Category,:Android_App_URL,:photo
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }
  validates :Android_App_URL, :format => URI::regexp(%w(http https))
  validates :Selling_Price, :format => { :with => /\A\d+(?:\.\d{0,2})?\z/ }, :numericality => {:greater_than => 0, :less_than => 100}
  validates :Long_Description ,length: { maximum: 250 }
  
  #for friendly url 
  extend FriendlyId
  friendly_id :name, use: :slugged

end
