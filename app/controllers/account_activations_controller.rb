# frozen_string_literal: true

class AccountActivationsController < ApplicationController
  def edit
    user = User.find_by(email: params[:email])
    if user && !user.activated? && user.authenticated?(:activation, params[:id])
      update_attribute_and_log_in_user
      flash[:success] = 'Account activated!'
      redirect_to user
    else
      flash[:danger] = 'Invalid activation link'
      redirect_to root_url
    end
  end

  private

  def update_attribute_and_log_in_user
    user.update_attribute(:activated,    true)
    user.update_attribute(:activated_at, Time.zone.now)
    log_in user
  end
end
