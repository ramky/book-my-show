class DashboardController < ApplicationController
  def index
    @movies = Show.where(show_type: 'movies')
    @events = Show.where(show_type: 'events')
    @plays = Show.where(show_type: 'plays')
    @sports = Show.where(show_type: 'sports')
  end
end