class  BeneficiariesController < ApplicationController
  devise_token_auth_group :member, contains: [:user, :admin]
  before_action :authenticate_member!, only: [:index]
  before_action :authenticate_admin!, except: [:index]
  def index
    render json: Beneficiary.where(user_id: current_user.id)
  end

  def create
    beneficiary = Beneficiary.new(beneficiary_params)
    beneficiary.user_id = current_user.id
    if beneficiary.save
      render json: beneficiary, status: :created
    else
      render json: beneficiary.errors, status: :unprocessable_entity
    end
  end

  def update
    beneficiary = Beneficiary.find(params[:id])
    if beneficiary.update(beneficiary_params)
      render json: beneficiary, status: :ok
    else
      render json: beneficiary.errors, status: :unprocessable_entity
    end
  end

  def destroy
    beneficiary = Beneficiary.find(params[:id])
    if beneficiary.destroy
      render json: beneficiary, status: :ok
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
