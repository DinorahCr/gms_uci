class Member < ActiveRecord::Base
   validates_presence_of :name
   validates_presence_of :body
   validates_presence_of :image
   mount_uploader :image, ImageUploader
   crop_uploaded :image
end
