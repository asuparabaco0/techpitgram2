class User < ApplicationRecord
  #親モデルを削除する際に、その親モデルに紐づく「子モデル」も一緒に削除できる
  has_many :posts, dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true, length: { maximum: 50 }
  def update_without_current_password(params, *options)

  if params[:password].blank? && params[:password_confirmation].blank?
    params.delete(:password)
    params.delete(:password_confirmation)
  end

  result = update_attributes(params, *options)
  clean_up_passwords
  result
end
end
