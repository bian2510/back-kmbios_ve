class  BeneficiariesController < ApplicationController
  before_action :authenticate_user!
  def index
    render json: Beneficiary.all
  end

  def create
    beneficiary = Beneficiary.new(beneficiary_params)
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
