require "rails_helper"
RSpec.feature "Deleting an Application" do

    before do
        @customer = Customer.create(customerFirstName: "Joey",
            customerLastName: "williamson",customerEmail:"joey@onegreatstudio", customerPhone:"784220242",businessName: "OneGreat",businessLogo:"lopsum",
            businessTrn: "124563",businessEmail:"joey@onegreatstudio", businessPhone:"784220242",businessAddress:"Cornwall Courts") 
    end
    scenario "A user deletes an application" do
        visit "/"
        click_link @customer.title 
        click_link "Delete Application"
        expect(page).to have_content("Application has been deleted")
        expect(current_path).to eq(customer_path) 
    end
end
