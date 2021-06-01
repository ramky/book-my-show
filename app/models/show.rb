class Show < ActiveRecord::Base
  validates :name, presence: true
  validates :location, presence: true
  validates :show_type, presence: true
  validates :show_dt_time, presence: true
end