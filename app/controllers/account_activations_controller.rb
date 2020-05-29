# frozen_string_literal: true

class AccountActivationsController < ApplicationController
  def edit
    if user && !user.activated? && user.authenticated?(:activation, params[:id])
      activate_and_log_in_user
      flash[:success] = 'Account activated!'
      redirect_to user
    else
      flash[:danger] = 'Invalid activation link'
      redirect_to root_url
    end
  end

  private

  def user
    @user = User.find_by(email: params[:email])
  end

  def activate_and_log_in_user
    user.activate
    log_in user
  end
end
