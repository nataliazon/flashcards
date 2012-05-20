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
  before_save { |user| user.email = email.downcase }
  validates :name, presence: true, length: { :maximum => 50 }, uniqueness: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: {with: VALID_EMAIL_REGEX}, uniqueness: true
  validates :password, presence: true, length: { :minimum => 7 }
  validates :password_confirmation, presence: true
  
end
