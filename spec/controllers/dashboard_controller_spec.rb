
require 'rails_helper'

RSpec.describe DashboardController, type: :controller do
  describe 'GET :index' do
    it 'should assign the instance variable called :movies' do
      movie   = create(:show, show_type: 'movies')
      sport   = create(:show, show_type: 'sports')

      get :index

      expect(assigns(:movies)).to match_array [movie]
      expect(assigns(:sports)).to match_array [sport]
    end
  end
end