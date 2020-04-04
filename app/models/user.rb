class User < ApplicationRecord
  def to_pleasant_string
    "Unique id=#{id}-->Name:#{name}-->mail: #{email}"
  end
end
