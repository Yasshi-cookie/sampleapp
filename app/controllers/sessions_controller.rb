# frozen_string_literal: true

class SessionsController < ApplicationController
  def new; end

  def create
    if user&.authenticate(params[:session][:password])
      login_and_remember
      params[:session][:remember_me] == '1' ? remember(user) : forget(user)
      redirect_to user
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end

  private

  def user
    @user ||= User.find_by(email: params[:session][:email].downcase)
  end

  def login_and_remember
    log_in user
    remember user
  end
end
