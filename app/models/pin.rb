class Pin < ActiveRecord::Base
  belongs_to :user

  has_attached_file :image,
    style: {medium: "300x300>"},
    url: "/public/system/pins/images/..."
    # path: "rails_root/public/system/..."
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
    #the second line ensures that the image that gets upload has a valid extension and not like pdf
end



