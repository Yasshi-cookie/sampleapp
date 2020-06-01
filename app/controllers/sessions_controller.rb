# frozen_string_literal: true

class SessionsController < ApplicationController
  def new; end

  def create
    if user&.authenticate(params[:session][:password])
      do_in_the_case_valid_user
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

  def flash_message_for_non_activated_account
    message = 'Account not activated. Check your email for the activation link.'
    flash[:warning] = message
  end

  def do_in_the_case_valid_user
    if user.activated?
      log_in user
      params[:session][:remember_me] == '1' ? remember(user) : forget(user)
      redirect_back_or user
    else
      flash_message_for_non_activated_account
      redirect_to root_url
    end
  end
end
