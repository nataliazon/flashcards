# == Schema Information
#
# Table name: users
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  email      :string(255)
#  birthdate  :date
#  about      :text
#  webpage    :string(255)
#  country    :string(255)
#  active     :boolean
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

class User < ActiveRecord::Base
  attr_accessible :about, :active, :birthdate, :country, :email, :name, :webpage, :password, :password_confirmation
  has_secure_password
  has_many :cards
  has_many :cardsets
  before_save { |user| user.email = email.downcase }
  before_save :create_remember_token
  validates :name, presence: true, length: { :maximum => 50 }, uniqueness: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: {with: VALID_EMAIL_REGEX}, uniqueness: true
  validates :password, presence: true, length: { :minimum => 7 }
  validates :password_confirmation, presence: true
    private

    def create_remember_token
      self.remember_token = SecureRandom.urlsafe_base64
    end
end
