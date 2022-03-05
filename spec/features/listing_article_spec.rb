require "rails_helper" 

RSpec.feature "Listing users" do
    before do
        @user1 = User.create(
        first: "The first name",
        last: "Lorem ipsum dolor sit amet, consectetur.",
        email: "Lorem ipsum dolor sit amet", 
        phone: "Lorem ipsum dolor sit amet", 
    
    ) 
        @user2 = User.create(
            first: "The first name",
            last: "Lorem ipsum dolor sit amet, consectetur.",
            email: "Lorem ipsum dolor sit amet", 
            phone: "Lorem ipsum dolor sit amet",) 
    end

    scenario "A user lists all users" do

        visit "/"
        expect(page).to have_content(@user1.first) 
        expect(page).to have_content(@user1.last) 
        expect(page).to have_content(@user1.email) 
        expect(page).to have_content(@user1.phone) 
        expect(page).to have_content(@user2.first) 
        expect(page).to have_content(@user2.last) 
        expect(page).to have_content(@user2.email) 
        expect(page).to have_content(@user2.phone) 
        expect(page).to have_link(@user1.first) 
        expect(page).to have_link(@user2.first)
    end

      before do
        @firm1 = Firm.create(
        name: "The first name",
        trn: "123456.",
        email: "joey@onegreatstudio.com", 
        phone: "54521452", 
        address: "Lorem ipsum dolor sit amet",
    
    ) 
        @firm2 = Firm.create(
            name: "The first name",
            trn: "123456.",
            email: "joey@onegreatstudio.com", 
            phone: "54521452", 
            address: "Lorem ipsum dolor sit amet",
        ) 
    end

    scenario "A user lists all firms" do

        visit "/"
        expect(page).to have_content(@firm1.name) 
        expect(page).to have_content(@firm1.trn) 
        expect(page).to have_content(@firm1.email) 
        expect(page).to have_content(@firm1.phone) 
        expect(page).to have_content(@firm1.address)
        expect(page).to have_content(@firm2.name) 
        expect(page).to have_content(@firm2.trn) 
        expect(page).to have_content(@firm2.email) 
        expect(page).to have_content(@firm2.phone) 
        expect(page).to have_content(@firm2.address)
        expect(page).to have_link(@firm1.name) 
        expect(page).to have_link(@firm2.name)
    end

    scenario "A user has no users" do 
        Article.delete_all

        visit "/"

        expect(page).not_to have_content(@user1.title) 
        expect(page).to have_content(@user1.first) 
        expect(page).to have_content(@user1.last) 
        expect(page).to have_content(@user1.email) 
        expect(page).to have_content(@user1.phone) 
        expect(page).to have_content(@user2.first) 
        expect(page).to have_content(@user2.last) 
        expect(page).to have_content(@user2.email) 
        expect(page).to have_content(@user2.phone)
        expect(page).to have_link(@user1.first) 
        expect(page).to have_link(@user2.first)

        within ("h1#no-users") do
            
        expect(page).to have_content("No user added")
    end 

    scenario "A user has no firms" do 
        Article.delete_all

        visit "/"

        expect(page).not_to have_content(@user1.title) 
        expect(page).to have_content(@firm1.name) 
        expect(page).to have_content(@firm1.trn) 
        expect(page).to have_content(@firm1.email) 
        expect(page).to have_content(@firm1.phone) 
        expect(page).to have_content(@firm1.address) 
        expect(page).to have_content(@user2.first) 
        expect(page).to have_content(@user2.last) 
        expect(page).to have_content(@user2.email) 
        expect(page).to have_content(@user2.phone)
        expect(page).to have_link(@firm1.name) 
        expect(page).to have_link(@firm2.name)

        within ("h1#no-users") do
            
        expect(page).to have_content("No user added")
    end 
end