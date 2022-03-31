class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_one_attached :avatar do |attachable|
    attachable.variant :thumb, resize_to_limit: [80, 80]
  end
  has_many :gists, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :notifications

  validates :first_name, presence: { message: "الرجاء إضافة الاسم" }
  validates :last_name, presence: { message: "الرجاء إضافة الكنية" }
  validates :email, format: {with: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i, message: 'الرجاء إدخال ايميل صحيح'}

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
