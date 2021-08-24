class Photo < ApplicationRecord
  belongs_to :post
  validates :image, presence: true
  #mount_uploader :carrierwave用に作ったカラム名, carrierwaveの設定ファイルのクラス名
  mount_uploader :image, ImageUploader
end
