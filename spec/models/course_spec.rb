require 'rails_helper'

RSpec.describe Course do
  # it { is_expected.to validate_presence_of(:title) }
  # 簡化版
  it { should validate_presence_of(:title) }
  test
end
