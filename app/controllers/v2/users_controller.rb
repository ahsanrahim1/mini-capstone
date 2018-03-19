class V2::UsersController < ApplicationController


  def create
    user = user.ner({
      name: params["name"],
      email: params["email"],
      password: params["password"],
      confrim_password: params["confrim_password"]
     })
    if user.save
      render json: {message: "your account has been created"}, status:created
    else
      rednder json: {message: "something went wrong please try again"}, status: bad_request
    end

  end
end
