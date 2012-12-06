require 'spec_helper'

describe "Item Pages" do
  subject {page}

  let(:user) {FactoryGirl.create(:user)}
  before{sign_in user}

  describe "item creation" do
    before {visit user_items_path(user)}

    describe "with invalid information" do
      #TODO
      it "should not create an item" do
      end
      describe "error messages" do
      end
    end

    describe "with valid information" do
      #before {TODO}
      it "should create an item" do
        expect {click_button "Add to Collection"}.to change(Item, :count).by(1)
      end

    end
  end

end
