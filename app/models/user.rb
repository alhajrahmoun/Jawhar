class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_one_attached :avatar do |attachable|
    attachable.variant :thumb, resize_to_limit: [80, 80]
  end
  has_many :gists, dependent: :destroy
  has_many :bookmarks, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :notifications, foreign_key: 'recipient_id'

  validates :first_name, presence: { message: "الرجاء إضافة الاسم" }
  validates :last_name, presence: { message: "الرجاء إضافة الكنية" }
  validates :email, format: {with: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i, message: 'الرجاء إدخال ايميل صحيح'}

  after_create_commit :send_welcome_mail, if: -> { Rails.env.production? }

  def send_welcome_mail
    ModelMailer.mail_to(email).deliver
  end

  def unread_notifications_count
    notifications.where(read: false).count
  end

  def self.active_users
    count = 0
    all.each do |user|
      count += 1 if user.last_sign_in_at > Time.zone.today - 7
    end
    count
  end

  def full_name
    [first_name, last_name].join(' ')
  end
end
