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
  validates :email, format: {with: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i, message: 'الرجاء إدخال ايميل صحيح'}
  validates_integrity_of :avatar
 
  after_create :send_welcome_mail
  def send_welcome_mail
    ModelMailer.mail_to(self.email).deliver if Rails.env.production?
  end


  def self.active_users
  	count = 0
  	self.all.each do |user|
  		count += 1 if user.last_sign_in_at > Time.zone.today - 7
  	end
  	count
  end
end
