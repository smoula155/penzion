class Image < ActiveRecord::Base

    has_attached_file :picture,
    :storage => :dropbox,
    :dropbox_credentials => Rails.root.join("config/dropbox.yml"),
    :dropbox_options => {},
    :path => ":style/:id_:filename"

 	validates_attachment_content_type :picture, content_type: /\Aimage\/.*\Z/

  	belongs_to :room
end
