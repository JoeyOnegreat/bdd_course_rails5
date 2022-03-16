class CustomerSerializer < ActiveModel::Serializer
    include Rails.application.routes.url_helpers

    attributes :id, :customerFirstName, :customerLastName, :customerPhone, :customerEmail, :businessName, :businessLogo, :businessTrn, :businessEmail, :street, :city, :state, :zipcode, :country, :businessPhone
   
    def businessLogo
        businessLogo = object.businessLogo
          rails_blob_path(businessLogo , only_path: true) if object.businessLogo.attached?
        
    end
end