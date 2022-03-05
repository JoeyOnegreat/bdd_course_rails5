require 'rails_helper'

RSpec.describe "users", type: :request do
    before do
        @user = User.create(name: "OneGreat",
            trn: "124563",email:"joey@onegreatstudio", phone:"784220242",address:"Cornwall Courts"))
    end

    describe 'GET /users/:id' do 
        context 'with existing user' do
            before { get "/users/#{@user.id}" }
            it "handles existing user" do 
                expect(response.status).to eq 200
            end 
        end
        context 'with non-existing user' do 
            before { get "/users/xxxxx" }

            it "handles non-existing user" do 
                expect(response.status).to eq 302
                flash_message = "The user you are looking for could not be found"
                expect(flash[:alert]).to eq flash_message
            end 
        end
    end 

    before do
        @firm = Firm.create(name: "OneGreat",
            trn: "124563",email:"joey@onegreatstudio", phone:"784220242",address:"Cornwall Courts"))
    end

    describe 'GET /firmss/:id' do 
        context 'with existing firm' do
            before { get "/firms/#{@firm.id}" }
            it "handles existing firm" do 
                expect(response.status).to eq 200
            end 
        end
        context 'with non-existing firm' do 
            before { get "/firms/xxxxx" }

            it "handles non-existing firm" do 
                expect(response.status).to eq 302
                flash_message = "The firm you are looking for could not be found"
                expect(flash[:alert]).to eq flash_message
            end 
        end
    end 
end