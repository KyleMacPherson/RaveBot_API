require 'spec_helper'

describe Party, type: :model do

  it { is_expected.to have_many :songs}

end
