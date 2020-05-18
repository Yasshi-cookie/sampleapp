# frozen_string_literal: true

class SessionsController < ApplicationController
  def new; end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    # 「userが有効かつ、そのuserのpasswordが正しければ」の意味
    if user&.authenticate(params[:session][:password])
      log_in user
      redirect_to user
    else
      flash.now[:danger] = 'Invalid email/password combination'
      # flash.nowのメッセージは、その後リクエストが発生したときに消滅する
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end
end
