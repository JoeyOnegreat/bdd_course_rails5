require "rails_helper"
RSpec.feature "Showing an Application" do
before do
@customer = Customer.create(customerFirstName: "Joey",
    customerLastName: "williamson",customerEmail:"joey@onegreatstudio", customerPhone:"784220242",businessName: "OneGreat",businessLogo:"lopsum",
    businessTrn: "124563",businessEmail:"joey@onegreatstudio", businessPhone:"784220242",businessAddress:"Cornwall Courts") 

scenario "A user lists all application" do
visit "/"
click_link "See details"
expect(page).to have_content(@customer.customerFirstName) 
expect(page).to have_content(@customer.customerLastName) 
expect(page).to have_content(@customer.customerEmail) 
expect(page).to have_content(@customer.customerPhone) 
expect(page).to have_content(@customer.businessName) 
expect(current_path).to eq(article_path(@customer))
end 
end