require 'spec_helper'

describe "Static Pages" do
  subject {page}

  #Home Page tests
  describe "Home page" do
    before {visit root_path}

    it { should have_selector('h1', text: 'Fashion App')}
    it { should have_selector('title', text: full_title(''))}
    it { should_not have_selector 'title', text: '| Home'}
  end


  #Help page tests
  describe "Help page" do
    before {visit help_path}

    it {should have_selector('h1', text: 'Help')}
    it {should have_selector('title', text: full_title('Help'))}
  end


  #About page tests
  describe "About page" do
    before {visit about_path}

    it {should have_selector('h1', text:'About')}
    it {should have_selector('title', text: full_title('About Us'))}
  end

  #Contact page tests
  describe "Contact page" do
    before {visit contact_path}

    it {should have_selector('h1', text: 'Contact')}
    it {should have_selector('title', text: full_title('Contact'))}
  end

end
