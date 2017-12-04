class Photo < ApplicationRecord
  mount_uploader :file_location, PhotoImageUploader
  validates_presence_of :title, :date, :description, :file_location #驗證儲存資訊是否完整，有這行的話不完整的資料存不進去
end