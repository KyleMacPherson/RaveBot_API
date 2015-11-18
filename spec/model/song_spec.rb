require 'spec_helper'

describe Song, type: :model do

  it { is_expected.to belong_to :party}

end
