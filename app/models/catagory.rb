class Catagory < ActiveRecord::Base
  
  #validations
  #validates_presence_of :name

  #for friendly url 
  extend FriendlyId
  friendly_id :name

  #search user from list 
  def self.search(search)
    if search 
      Catagory.where('name LIKE  ? ', search)
    else
      Catagory.all
    end
  end
end
