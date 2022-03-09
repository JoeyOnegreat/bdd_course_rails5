require "rails_helper"
RSpec.feature "Creating Application" do 
scenario "A user create a new application" do
visit "/"
click_link "Create New Application"
fill_in "CustomerFirstName", with: "Joey" 
fill_in "CustomerLastName", with: "Williamson" 
fill_in "CustomerEmail", with: "Joey@onegtreatstudio.com" 
fill_in "CustomerPhone", with: "8768671816" 
fill_in "BusinessName", with: "One Great Studio" 
fill_in "BusinessLogo", with: "file" 
fill_in "BusinessTrn", with: "123456" 
fill_in "BusinessAddress", with: "New Kingston" 
fill_in "BusinessEmail", with: "Joey@onegtreatstudio.com" 
fill_in "BusinessPhone", with: "8761816" 
click_button "Create Customer"
expect(page).to have_content("New application has been created")
expect(page.current_path).to eq(customer_path) 

end


    scenario "A user fails to create a new application" do 
    visit "/"
    click_link "New User"
    fill_in "First", with: "Joey" 
    fill_in "last", with: "Williamson" 
    fill_in "Email", with: "Joey@onegtreatstudio.com" 
    fill_in "Phone", with: "8761816" 
    fill_in "BusinessName", with: "One Great Studio" 
    fill_in "BusinessLogo", with: "file" 
    fill_in "BusinessTrn", with: "123456" 
    fill_in "BusinessAddress", with: "New Kingston" 
    fill_in "BusinessEmail", with: "Joey@onegtreatstudio.com" 
    fill_in "BusinessPhone", with: "8761816" 
    click_button "Create Customer"
    expect(page).to have_content("Application has not been added") 
    expect(page).to have_content("customer first name can't be blank") 
    expect(page).to have_content("customer last name can't be blank")
    expect(page).to have_content("customer phone number can't be blank") 
    expect(page).to have_content("customer email can't be blank")
    expect(page).to have_content("business address can't be blank") 
    expect(page).to have_content("business name can't be blank") 
    expect(page).to have_content("business trn can't be blank")
    expect(page).to have_content("business phone number can't be blank") 
    expect(page).to have_content("business email can't be blank")
    end

end