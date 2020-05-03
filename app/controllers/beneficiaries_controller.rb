# frozen_string_literal: true

class BeneficiariesController < ApplicationController
  before_action :authenticate_admin!

  def index
    render json: Beneficiary.where(admin_id: current_admin.id)
  end

  def show
    if current_admin.id == beneficiary.admin_id
      render json: Beneficiary.find(params[:id])
    end
  end

  def create
    beneficiary = Beneficiary.new(beneficiary_params)
    beneficiary.admin_id = current_admin.id
    if beneficiary.save
      render json: beneficiary, status: :ok
    else
      render json: beneficiary.errors, status: :unprocessable_entity
    end
  end

  def update
    beneficiary = Beneficiary.find(params[:id])
    if current_admin.id == beneficiary.admin_id
      if beneficiary.update(beneficiary_params)
        render json: beneficiary, status: :ok
      else
        render json: beneficiary.errors, status: :unprocessable_entity
      end
    end
  end

  def destroy
    beneficiary = Beneficiary.find(params[:id])
    if current_admin == beneficiary.admin_id
      if beneficiary.destroy
        render json: Beneficiary.all, status: :ok
      else
        render json: beneficiary.errors, status: :unprocessable_entity
      end
    end
  end

  private

  def beneficiary_params
    params.require(:beneficiary).permit(:account_number, :name, :last_name,
                                        :bank, :personal_id, :telephone_number,
                                        :mobile_pay)
  end
end
