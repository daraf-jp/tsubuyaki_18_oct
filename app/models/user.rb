class User < ActiveRecord::Base
  authenticates_with_sorcery!

  has_many :tweets, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :follows, foreign_key: :inverse_follower_id
  has_many :followers, through: :follows
  has_many :inverse_follows, foreign_key: :follower_id, class_name: Follow
  has_many :inverse_followers, through: :inverse_follows

  validates :name, presence: true, uniqueness: { case_sensitive: false }, format: { with: /\A[a-z][a-z0-9]+\z/ }
  validates :email, presence: true, uniqueness: true
  validates :password, confirmation: true
  validates :password_confirmation, presence: true, if: :password

  def followed_by? user
    followers.where(id: user.id).exists?
  end
end
