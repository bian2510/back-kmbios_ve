class BeneficiaryController < ApplicationController
  def index
    render json: Beneficiary.all
  end
end
