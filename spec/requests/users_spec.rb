# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET /index' do
    before(:example) { get root_path }

    it 'should be a success' do
      expect(response).to have_http_status(:ok)
    end

    it "should render 'index' template" do
      expect(response).to render_template('index')
    end

    it 'should return the correct placeholder text' do
      expect(response.body).to include('BudgetTK')
    end
  end
end
