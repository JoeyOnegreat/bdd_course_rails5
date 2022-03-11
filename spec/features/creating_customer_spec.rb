require "rails_helper"
RSpec.feature "Creating Application" do 
scenario "A user create a new application" do
visit "/"
click_link "Create New Application"
fill_in "customer[customerFirstName]", with: "Joey"
fill_in "customer[customerLastName]", with: "Williamson" 
fill_in "customer[customerEmail]", with: "Joey@onegtreatstudio.com" 
fill_in "customer[customerPhone]", with: "8768671816" 
fill_in "customer[businessName]", with: "One Great Studio" 
#fill_in "customer[businessLogo]", with: "file" 
fill_in "customer[businessTrn]", with: "123456" 
fill_in "customer[businessAddress]", with: "New Kingston" 
fill_in "customer[businessEmail]", with: "Joey@onegtreatstudio.com" 
fill_in "customer[businessPhone]", with: "8761816" 
click_button "Create Customer"
expect(page).to have_content("New application has been created")
expect(page.current_path).to eq(customer_path) 

end


    scenario "A user fails to create a new application" do 
    visit "/"
    click_link "Create New Application"
    fill_in "customer[customerFirstName]", with: "Joey"
    fill_in "customer[customerLastName]", with: "Williamson" 
    fill_in "customer[customerEmail]", with: "Joey@onegtreatstudio.com" 
    fill_in "customer[customerPhone]", with: "8768671816" 
    fill_in "customer[businessName]", with: "One Great Studio" 
    #fill_in "customer[businessLogo]", with: "file" 
    fill_in "customer[businessTrn]", with: "123456" 
    fill_in "customer[businessAddress]", with: "New Kingston" 
    fill_in "customer[businessEmail]", with: "Joey@onegtreatstudio.com" 
    fill_in "customer[businessPhone]", with: "8761816" 
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