class User < ActiveRecord::Base
  authenticates_with_sorcery!

  has_many :tweets, dependent: :destroy
  has_many :favorites, dependent: :destroy

  validates :name, presence: true, uniqueness: { case_sensitive: false }, format: { with: /\A[a-z][a-z0-9]+\z/ }
  validates :email, presence: true, uniqueness: true
  validates :password, confirmation: true
  validates :password_confirmation, presence: true, if: :password
end
