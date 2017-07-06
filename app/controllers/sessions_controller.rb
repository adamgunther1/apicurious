class SessionsController < ApplicationController
  # def create
  #   @response = Faraday.post("https://github.com/login/oauth/access_token?client_id=#{ENV["GITHUB_KEY"]}&client_secret=#{ENV["GITHUB_SECRET"]}&code=#{params["code"]}")
  #   token = @response.body.split(/\W+/)[1]
  #   oauth_response = Faraday.get("https://api.github.com/user?access_token=#{token}")
  #   auth = JSON.parse(oauth_response.body)

  #   user = User.find_or_create_by(uid: auth["id"])
  #   user.username = auth["login"]
  #   user.uid = auth["id"]
  #   user.token = token
  #   user.save

  #   session[:user_id] = user.id

  #   redirect_to dashboard_index_path
  # end

  def create
    @user = User.find_or_create_from_auth(request.env['omniauth.auth'])
    if @user
      session[:user_id] = @user.id
      redirect_to dashboard_index_path
    else
      redirect_to root_path
    end
  end
end