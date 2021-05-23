class User < ApplicationRecord

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :name, :email, presence: true
  validates :email, uniqueness: { case_sensitive: false }, format: { with: VALID_EMAIL_REGEX }
  before_save :downcasemail

  def downcasemail
    self.email.downcase!
  end

  def self.find_name(id)
    user = User.find(id)
    user.name
  end

end
