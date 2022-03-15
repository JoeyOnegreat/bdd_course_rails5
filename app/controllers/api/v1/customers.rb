module API
    module V1
      class Customers < Grape::API
        include API::V1::Defaults
        resource :customers do
          desc "Return all users"
          get "" do
            @customers = Customer.all
          end
        desc "Return a user"
          params do
            requires :id, type: String, desc: "ID of the user"
          end
          get ":id" do
            Customer.where(id: permitted_params[:id]).first!
          end
        end
      end
    end
  end