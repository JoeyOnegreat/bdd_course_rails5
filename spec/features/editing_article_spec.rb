require "rails_helper"
RSpec.feature "Editing an user" do
    before do
        @user = User.create(first: "Joey",
            last: "williamson",email:"joey@onegreatstudio", phone:"784220242") 
    end

    scenario "A user updates an user" do
        visit "/"

        click_link @user.first 
        click_link "Edit User"
        fill_in "First", with: "Updated User" 
        fill_in "Last", with: "Lorem Ipsum" 
        fill_in "Email", with: "Updated User" 
        fill_in "Phone", with: "Lorem Ipsum" 
        click_button "Update User"
        expect(page).to have_content("User has been updated")
        expect(page.current_path).to eq(user_path(@user)) 
    end

    before do
        @firm = Firm.create(name: "OneGreat",
            trn: "124563",email:"joey@onegreatstudio", phone:"784220242",address:"Cornwall Courts") 
    end

    scenario "A user updates an firm" do
        visit "/"

        click_link @firm.name 
        click_link "Edit Firm"
        fill_in "Name", with: "Updated Firm" 
        fill_in "Trn", with: "Lorem Ipsum" 
        fill_in "Email", with: "Updated Firm" 
        fill_in "Phone", with: "Lorem Ipsum" 
        fill_in "Address", with: "Lorem Ipsum"
        click_button "Update Firm"
        expect(page).to have_content("User has been updated")
        expect(page.current_path).to eq(firm_path(@firm)) 
    end

    scenario "A user fails to update an user" do 
        visit "/"

        click_link @user.first click_link "Edit User"
        fill_in "First", with: "Updated User" 
        fill_in "Last", with: "Lorem Ipsum" 
        fill_in "Email", with: "Updated User" 
        fill_in "Phone", with: "Lorem Ipsum" 
        click_button "Update User"
        expect(page).to have_content("User has not been updated")
        expect(current_path).to eq(user_path(@user)) 
    end

    scenario "A user fails to update an firm" do 
        visit "/"

        click_link @firm.name click_link "Edit Firm"
        fill_in "Name", with: "Updated Firm" 
        fill_in "Trn", with: "Lorem Ipsum" 
        fill_in "Email", with: "Updated Firm" 
        fill_in "Phone", with: "Lorem Ipsum" 
        fill_in "Address", with: "Lorem Ipsum"
        click_button "Update Firm"
        expect(page).to have_content("Firm has not been updated")
        expect(current_path).to eq(firm_path(@firm)) 
    end
end