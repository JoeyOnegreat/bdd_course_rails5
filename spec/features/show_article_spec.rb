require "rails_helper"
RSpec.feature "Showing an User" do
before do
@user = User.create(first: "Joey",
last: "williamson",email:"joey@onegreatstudio", phone:"784220242") 

scenario "A user lists all users" do
visit "/"
click_link @user.first
expect(page).to have_content(@user.first) 
expect(page).to have_content(@user.last) 
expect(page).to have_content(@user.email) 
expect(page).to have_content(@user.phone) 
expect(current_path).to eq(article_path(@user))
end 

before do
    @firm = Firm.create(name: "OneGreat",
    trn: "124563",email:"joey@onegreatstudio", phone:"784220242",address:"Cornwall Courts") 
    
    scenario "A user lists all firms" do
    visit "/"
    click_link @firm.first
    expect(page).to have_content(@firm.name) 
    expect(page).to have_content(@firm.trn) 
    expect(page).to have_content(@firm.email) 
    expect(page).to have_content(@firm.phone) 
    expect(page).to have_content(@firm.address) 
    expect(current_path).to eq(article_path(@firm))
end 
end