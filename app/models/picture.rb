class Picture < ApplicationRecord
  belongs_to :service
  mount_uploader :url, PhotoUploader
end
