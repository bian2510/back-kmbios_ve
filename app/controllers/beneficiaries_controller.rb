# frozen_string_literal: true

class BeneficiariesController < ApplicationController
  devise_token_auth_group :member, contains: %i[user admin]
  before_action :authenticate_member!, only: [:index]
  before_action :authenticate_admin!, except: [:index]

  def index
    render json: Beneficiary.where(admin_id: current_admin.id)
  end

  def create
    beneficiary = Beneficiary.new(beneficiary_params)
    beneficiary.admin_id = current_admin.id
    if beneficiary.save
      if admin_signed_in?
        return render json: beneficiary, status: :ok
      end

      render json: beneficiary, status: :ok if user_signed_in?
    else
      render json: beneficiary.errors, status: :unprocessable_entity
    end
  end

  def update
    beneficiary = Beneficiary.find(params[:id])
    if beneficiary.update(beneficiary_params)
      if admin_signed_in?
        return render json: beneficiary, status: :ok
      end

      render json: beneficiary, status: :ok if user_signed_in?
    else
      render json: beneficiary.errors, status: :unprocessable_entity
    end
  end

  def destroy
    beneficiary = Beneficiary.find_by(params[:account_number])
    if beneficiary.destroy
      if admin_signed_in?
        return render json: Beneficiary.all, status: :ok
    else
      render json: beneficiary.errors, status: :unprocessable_entity
    end
  end

  private

  def beneficiary_params
    params.require(:beneficiary).permit(:account_number, :name, :last_name,
                                        :bank, :personal_id, :telephone_number,
                                        :mobile_pay)
  end
end
