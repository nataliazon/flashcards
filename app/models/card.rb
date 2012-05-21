class Card < ActiveRecord::Base
  attr_accessible :definition, :public, :term
  belongs_to :user
  has_and_belongs_to_many :cardsets
  validates :user_id, presence: true
  validates :term, presence: true
  validates :definition, presence: true
  default_scope order: 'cards.created_at DESC'
end
