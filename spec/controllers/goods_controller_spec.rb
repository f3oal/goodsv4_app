require 'spec_helper'

describe GoodsController do 

	describe 'GET #show' do
		it "assigns the requested good to @good" do
			good = create(:good)
			get :show, id: good
			expect(assigns(:good)).to eq good
		end
	end
end