require 'rails_helper'

describe "apply" do
    it "a account can create application and manage" do
   # user=Factory(:user)
    visit '/login'
    fill_in "session_email",with: 'test'
    click_link "Log in"
    
    end
end