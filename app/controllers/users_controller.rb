class UsersController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    name = params[:name]
    email = params[:email]
    password = params[:password]

    new_user = User.create(
      name: name,
      email: email,
      password: password,
    )
    response_text = "hey,Your new Todo is created with id #{new_user.id}"
    render plain: response_text
  end

  def index
    render plain: User.all.map { |user| user.to_pleasant_string }.join("\n")
  end

  def show
    id = params[:id]
    user = User.find(id)
    render plain: user.to_pleasant_string
  end

  def login
    email = params[:email]
    password = params[:password]
    user_srch_result = User.find_by email: email
    if (user_srch_result.password == password)
      render plain: true
    else
      render plain: false
    end
  end
end
