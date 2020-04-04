class UserssController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    todo_text = params[:todo_text]
    due_date = DateTime.parse(params[:due_date])
    new_todo = Todo.create(
      todo_text: todo_text,
      due_date: due_date,
      completed: false,
    )
    response_text = "hey,Your new Todo is created with id #{new_todo.id}"
    render plain: response_text
  end
end
