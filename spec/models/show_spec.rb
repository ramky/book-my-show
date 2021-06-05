require 'rails_helper'

RSpec.describe Show, type: :model do
  it { should validate_presence_of(:name)  }
  it { should validate_presence_of(:location)  }
  it { should validate_presence_of(:show_type)  }
  it { should validate_presence_of(:show_dt_time)  }
end