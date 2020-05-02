class User < ApplicationRecord
  validates :first_name, presence: true
  validates :email, presence: true

  has_secure_password
  has_many :todos

  def to_pleasant_string
    "Unique id=#{id}-->Name:#{name}-->mail: #{email}"
  end
end
