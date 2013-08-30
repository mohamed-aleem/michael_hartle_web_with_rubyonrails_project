require 'spec_helper'

describe "Static pages" do
subject {page}
    describe "Home page" do
    before {visit root_path}
    
      
      it {should have_content('Sample App')}  
      it {should have_title(full_title(''))}
      
    end
    describe "Help page" do

      it "should have the content 'help'" do
        visit help_path
        expect(page).to have_content('Help')
      end
    end
    describe "Contact Page" do
      it "should have the content contact" do
        visit contact_path
        expect(page).to have_content('contact')
      end
    end
end