require "rails_helper" 

RSpec.feature "Listing applications" do
    before do
        @customer1 = Customer.create(
        customerFirstName: "The first name",
        customerLastName: "Lorem ipsum dolor sit amet, consectetur.",
        customerEmail: "Lorem ipsum dolor sit amet", 
        customerPhone: "Lorem ipsum dolor sit amet", 
        businessName: "one great studio", 
    
    ) 
        @customer2 = Customer.create(
            first: "The first name",
            last: "Lorem ipsum dolor sit amet, consectetur.",
            email: "Lorem ipsum dolor sit amet", 
            phone: "Lorem ipsum dolor sit amet",) 
    end

    scenario "A user lists all applications" do

        visit "/"
        expect(page).to have_content(@customer1.customerFirstName) 
        expect(page).to have_content(@customer1.customerLastName) 
        expect(page).to have_content(@customer1.customerEmail) 
        expect(page).to have_content(@customer1.customerPhone) 
        expect(page).to have_content(@customer1.businessName) 
        expect(page).to have_content(@customer2.customerFirstName) 
        expect(page).to have_content(@customer2.customerLastName) 
        expect(page).to have_content(@customer2.customerEmail) 
        expect(page).to have_content(@customer2.customerPhone) 
        expect(page).to have_content(@customer2.businessName) 
        expect(page).to have_link("See details") 
        expect(page).to have_link("See details")
    end

  
 
    scenario "A user has no users" do 
        Article.delete_all

        visit "/"
        expect(page).not_to have_content(@customer1.customerFirstName) 
        expect(page).to have_content(@customer1.customerFirstName) 
        expect(page).to have_content(@customer1.customerLastName) 
        expect(page).to have_content(@customer1.customerEmail) 
        expect(page).to have_content(@customer1.customerPhone) 
        expect(page).to have_content(@customer1.businessName) 
        expect(page).to have_content(@customer2.customerFirstName) 
        expect(page).to have_content(@customer2.customerLastName) 
        expect(page).to have_content(@customer2.customerEmail) 
        expect(page).to have_content(@customer2.customerPhone) 
        expect(page).to have_content(@customer2.businessName) 
        expect(page).to have_link("See details") 
        expect(page).to have_link("See details")

        within ("h1#no-users") do
            
        expect(page).to have_content("No user added")
    end 

   
end