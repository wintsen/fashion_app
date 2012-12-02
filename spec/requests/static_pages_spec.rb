require 'spec_helper'

describe "Static Pages" do

  #Home Page tests
  describe "Home page" do
    it "should have h1 'Fashion App'" do
      visit '/static_pages/home'
      page.should have_selector('h1', :text => 'Fashion App')
    end

    it "should have the base title" do
      visit '/static_pages/home'
      page.should have_selector('title', :text => "Fashion App")
    end

    it "should not have a custom page title" do
      visit '/static_pages/home'
      page.should_not have_selector('title', :text => '| Home')
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

  #Contact page tests
  describe "Contact page" do
    it "should have the h1 'Contact'" do
      visit '/static_pages/contact'
      page.should have_selector('h1', text:'Contact')
    end

    it "should have the title 'Contact'" do
      visit '/static_pages/contact'
      page.should have_selector('title' , text: "Fashion App | Contact")
    end
  end

end
