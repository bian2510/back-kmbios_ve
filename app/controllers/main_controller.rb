# frozen_string_literal: true

class MainController < ApplicationController
  devise_token_auth_group :member, contains: %i[user admin]
  before_action :authenticate_member!, only: [:index]

  def index
    show = LoaderData.new
    return render json: show.data_for_admin, status: :ok if admin_signed_in?

    if user_signed_in?
      render json: show.data_for_user(current_user), status: :ok
    end
  end

  def params_login
    params.require(:main).permit(:email, :password)
  end
end
