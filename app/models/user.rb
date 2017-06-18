class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  mount_uploader :avatar, AvatarUploader
  has_many :gists, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :notifications

  validates :first_name, presence: { message: "الرجاء إضافة الاسم" }
  validates :last_name, presence: { message: "الرجاء إضافة الكنية" }


  def self.active_users
  	count = 0
  	self.all.each do |user|
  		count += 1 if user.last_sign_in_at > Time.zone.today - 7
  	end
  	count
  end
end
