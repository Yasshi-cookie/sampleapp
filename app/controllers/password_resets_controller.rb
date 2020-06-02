# frozen_string_literal: true

class PasswordResetsController < ApplicationController
  before_action :set_user,   only: %i[edit update]
  before_action :valid_user, only: %i[edit update]
  before_action :check_expiration, only: %i[edit update] # パスワード再設定の有効期限が切れていないかをチェックする

  def new; end

  def create
    @user = User.find_by(email: params[:password_reset][:email].downcase)
    if @user
      @user.create_reset_digest
      @user.send_password_reset_email
      flash[:info] = 'Email sent with password reset instructions'
      redirect_to root_url
    else
      flash.now[:danger] = 'Email address not found'
      render 'new'
    end
  end

  def edit; end

  def update
    if params[:user][:password].empty? # 新しいパスワードが空文字列になっていないかをチェックする
      @user.errors.add(:password, :blank)
      render 'edit'
    elsif @user.update_attributes(user_params) # 新しいパスワードが正しければ更新する
      log_in_user_and_update_reset_digest_to_nil
      flash[:success] = 'Password has been reset.'
      redirect_to @user
    else
      render 'edit' # 無効なパスワードを拒否する
    end
  end

  private

  def log_in_user_and_update_reset_digest_to_nil
    log_in @user
    @user.update_attribute(:reset_digest, nil) # @userのreset_digestの値をnilに更新して保存
  end

  def user_params
    params.require(:user).permit(:password, :password_confirmation)
  end

  # beforeフィルタ

  def set_user
    @user = User.find_by(email: params[:email])
  end

  # 正しいユーザーかどうか確認する
  def valid_user
    redirect_to root_url unless @user&.activated? && @user&.authenticated?(:reset, params[:id])
  end

  # トークンが期限切れかどうか確認する
  def check_expiration
    return unless @user.password_reset_expired?

    flash[:danger] = 'Password reset has expired.'
    redirect_to new_password_reset_url
  end
end
