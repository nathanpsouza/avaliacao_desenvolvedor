require 'rails_helper'

RSpec.describe OrdersController, type: :controller do
  describe 'GET #index' do
    it 'assign orders to @order' do
      orders = FactoryGirl.create_list(:order, 3)
      get :index
      expect(assigns[:orders]).to match_array(orders)
    end

    it 'render template index' do
      get :index
      expect(response).to render_template(:index)
    end

    it 'return http status success' do
      get :index
      expect(response).to have_http_status(:ok)
    end
  end
end
