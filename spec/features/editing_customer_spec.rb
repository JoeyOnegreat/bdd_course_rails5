require "rails_helper"
RSpec.feature "Editing an application" do
    before do
        @customer = Customer.create(customerFirstName: "Joey",
            customerLastName: "williamson",customerEmail:"joey@onegreatstudio", customerPhone:"784220242",businessName: "OneGreat",businessLogo:"lopsum",
            businessTrn: "124563",businessEmail:"joey@onegreatstudio", businessPhone:"784220242",businessAddress:"Cornwall Courts") 
    end

    scenario "A user updates application" do
        visit "/"

        click_link @customer.first 
        click_link "Edit Application"
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
        click_button "Update Application"
        expect(page).to have_content("Application has been updated")
        expect(page.current_path).to eq(customer_path(@customer)) 
    end


    scenario "A user fails to update application" do 
        visit "/"

        click_link @customer.first click_link "Edit Application"
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
        click_button "Update Application"
        expect(page).to have_content("Application has not been updated")
        expect(current_path).to eq(customer_path(@customer)) 
    end

end