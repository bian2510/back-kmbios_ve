# frozen_string_literal: true

RSpec.shared_context 'logged_admin' do
  let!(:admin) { create(:admin) }

  before do
    sign_in admin
    request.headers.merge!(admin.create_new_auth_token) if sign_in(admin)
  end
end
