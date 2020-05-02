# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Beneficiary', type: :request do
  include ActionController::RespondWith
  # include_context 'logged_admin'
  # describe 'GET /' do
  #  let!(:beneficiaries) { FactoryBot.create_list(:random_beneficiary, 20) }
  #  before(:each) do
  #    @current_user = FactoryBot.create(:admin)
  #    @client = FactoryBot.create(:user)
  #  end
  #  before { get beneficiaries_path(@current_user) }
  #  context 'If an admin is logged' do
  #    it 'and have beneficiaries associatedreturn an array with all beneficiaries' do
  #      expect(JSON.parse(response.body).size).to eq(20)
  #    end
  #  end
  # end

  describe 'GET /' do
    context 'If an Admin' do
      it 'not are logged return status code 401 Unauthorized' do
        get beneficiaries_path
        expect(response.status).to eq(401)
      end

      it 'are logged return status code 200 Ok' do
        login_admin
        get beneficiaries_path
        puts JSON.parse(response.body)
        expect(response.status).to eq(200)
      end
    end

    # context 'If an Admin are logged' do
    #  context 'and not have register of beneficiaries' do
    #    it 'return an empty array' do
    #      #request.headers.merge! resource.create_new_auth_token
    #      login_as(FactoryBot.create(:admin))
    #      get beneficiaries_path
    #      puts JSON.parse(response.body)
    #      expect(JSON.parse(response.status)).to eq(200)
    #    end
    #  end
    # end
  end
end
