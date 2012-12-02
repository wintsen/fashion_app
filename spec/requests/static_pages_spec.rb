require 'spec_helper'

describe "StaticPages" do

  #Home Page tests
  describe "Home page" do
    it "should have the 'Fashion App'" do
      visit '/static_pages/home'
      page.should have_selector('h1', :text => 'Fashion App')
    end

    it "should have the title 'Home'" do
      visit '/static_pages/home'
      page.should have_selector('title', :text => "Fashion App | Home")
    end
  end


  #Help page tests
  describe "Help page" do
    it "should have the h1 'Help'" do
      visit '/static_pages/help'
      page.should have_selector('h1', :text => 'Help')
    end

    it "should have the title 'Help'" do
      visit '/static_pages/help'
      page.should have_selector('title', :text => "Fashion App | Help")
    end
  end


  #About page tests
  describe "About page" do
    it "should have the h1 'About us'" do
      visit '/static_pages/about'
      page.should have_selector('h1', :text => 'About Us')
    end

    it "should have the title 'About Us'" do
      visit '/static_pages/about'
      page.should have_selector('title', :text => "Fashion App | About Us")
    end
  end

end
