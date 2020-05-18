# frozen_string_literal: true

class SessionsController < ApplicationController
  def new; end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user&.authenticate(params[:session][:password])
      # 「userが有効かつ、そのuserのpasswordが正しければ」の意味
      # ユーザーログイン後にユーザー情報のページにリダイレクトする
    else
      flash[:danger] = 'Invalid email/password combination' # 本当は正しくない
      render 'new'
    end
  end

  def destroy; end
end