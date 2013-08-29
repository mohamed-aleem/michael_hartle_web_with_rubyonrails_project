require 'spec_helper'

describe "Static pages" do

  describe "Home page" do

    it "should have the content 'Sample App'" do
      visit '/static_pages/home'
      expect(page).to have_content('Sample App')
    end
    
    it "should not have the right title" do
      visit '/static_pages/home'
      expect(page).not_to have_title('| Home')
    end
    describe "Help page" do

    it "should have the content 'help'" do
      visit '/static_pages/help'
      expect(page).to have_content('Help')
    end
    end
  end
end