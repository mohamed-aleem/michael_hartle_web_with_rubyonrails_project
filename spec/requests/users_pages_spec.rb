require 'spec_helper'



describe "UsersPages" do
  subject {page}
  describe "signup page" do
    before {visit signup_path}
    let(:submit) {"Create my account"}
    
    it {should have_content('Sign up')}
    it {should have_title(full_title('Sign up'))}
    
    describe "with invalid information" do
      it "should not create user" do
        expect {click_button submit}.not_to change(User,:count)
      end
    end
    describe "with valid information" do
      before do
        fill_in "Name", with: "Example User"
        fill_in "Email", with: "user@example.com"
        fill_in "Password", with: "foobar"
        fill_in "confirmation", with: "foobar"
      end
      
      it "should create user" do
        expect {click_button submit}.to change(User,:count).by(1)
      end
    end
  end
  
  
  
  describe "profile page" do
    let(:user) {User.create(name: "hamoda", email: "molased@gmail.com", password: "solasers", password_confirmation: "solasers")}
    before {visit user_path(user)}
    
    it {should have_content(user.name)}
    it {should have_title(user.name)}
  end
  
  
end


