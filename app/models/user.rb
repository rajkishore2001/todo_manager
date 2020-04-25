class User < ApplicationRecord
  has_secure_password
  has_many :todos
  #User.first.todos
  def to_pleasant_string
    "Unique id=#{id}-->Name:#{name}-->mail: #{email}"
  end
end
