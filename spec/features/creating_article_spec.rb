require "rails_helper"
RSpec.feature "Creating Users" do 
scenario "A user added new details" do
visit "/"
click_link "Create New User"
fill_in "First", with: "Joey" 
fill_in "Last", with: "Williamson" 
fill_in "Email", with: "Joey@onegtreatstudio.com" 
fill_in "Phone", with: "8761816" 
click_button "Create User"
expect(page).to have_content("New user has been created")
expect(page.current_path).to eq(users_path) 

end

scenario "A user added new firm" do
    visit "/"
    click_link "Create New Firm"
    fill_in "Name", with: "One Great Studio" 
    fill_in "Trn", with: "123456" 
    fill_in "Address", with: "New Kingston" 
    fill_in "Email", with: "Joey@onegtreatstudio.com" 
    fill_in "Phone", with: "8761816" 
    click_button "Create User"
    expect(page).to have_content("New business has been created")
    expect(page.current_path).to eq(firms_path) 
    
end

    scenario "A user fails to create a new user" do 
    visit "/"
    click_link "New User"
    fill_in "First", with: "Joey" 
    fill_in "last", with: "Williamson" 
    fill_in "Email", with: "Joey@onegtreatstudio.com" 
    fill_in "Phone", with: "8761816" 
    click_button "Create User"
    expect(page).to have_content("User has not been added") 
    expect(page).to have_content("first name can't be blank") 
    expect(page).to have_content("last name can't be blank")
    expect(page).to have_content("phone number can't be blank") 
    expect(page).to have_content("email can't be blank")
    end

    scenario "A user fails to create a new firm" do 
        visit "/"
        click_link "New firm"
        fill_in "name", with: "OneGreatStudio" 
        fill_in "trn", with: "12456" 
        fill_in "Email", with: "Joey@onegtreatstudio.com" 
        fill_in "Phone", with: "8761816" 
        fill_in "address", with: "Cornwall courts"
        click_button "Create User"
        expect(page).to have_content("User has not been added") 
        expect(page).to have_content("address can't be blank") 
        expect(page).to have_content("name can't be blank") 
        expect(page).to have_content("trn can't be blank")
        expect(page).to have_content("phone number can't be blank") 
        expect(page).to have_content("email can't be blank")
    end
end