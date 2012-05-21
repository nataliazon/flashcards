class Cardset < ActiveRecord::Base
  attr_accessible :category, :public, :user_id, :name
  belongs_to :user
  has_and_belongs_to_many :cards
  validates :user_id, presence: true
  validates :category, presence: true
  validates :name, presence: true
  default_scope order: 'cardsets.created_at DESC'
end
