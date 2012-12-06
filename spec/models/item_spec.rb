require 'spec_helper'

describe Item do

  let(:user) {FactoryGirl.create(:user)}
  before { @item = user.items.build()}

  subject {@item}

  it {should respond_to(:user_id)}
  it {should be_valid}

  describe "when user_id is not present" do
    before {@item.user_id = nil}
    it {should_not be_valid}
  end
end
