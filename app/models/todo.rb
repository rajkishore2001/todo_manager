class Todo < ActiveRecord::Base
  belongs_to :user
  validates :todo_text, presence: true
  validates :due_date, presence: true
  validates :todo_text, length: { minimum: 2 }

  def to_pleasant_string
    is_completed = completed ? "[x]" : "[ ]"
    "#{id}. #{due_date.to_s(:long)} #{todo_text} #{is_completed} "
  end

  def self.of_user(user)
    all.where(user_id: user.id)
  end

  def due_today?
    due_date == Date.today
  end

  def self.due_today
    all.where("due_date = ?", Date.today)
  end

  def self.due_later
    all.where("due_date > ?", Date.today)
  end

  def self.overdue
    all.where("due_date < ? and completed= ?", Date.today, false)
  end

  def self.completed
    all.where(completed: true)
  end
end
