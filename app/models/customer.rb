class Customer < ApplicationRecord

    validates :customerFirstName, presence: true
    validates :customerLastName, presence: true

    validates :customerEmail, presence: true
    validates :customerEmail, format: { with: URI::MailTo::EMAIL_REGEXP } 

    validates :customerPhone, presence: true
    validates :customerPhone, length: { minimum: 10, maximum: 10 }
    validates :customerPhone, numericality: { only_integer: true }

    validates :businessName, presence: true 
    validates :businessLogo, presence: true
    validates :businessTrn, presence: true
    validates :businessEmail, presence: true
    validates :businessEmail, format: { with: URI::MailTo::EMAIL_REGEXP } 

    validates :businessPhone, presence: true
    validates :businessPhone, length: { minimum: 10, maximum: 10 }
    validates :businessPhone, numericality: { only_integer: true }
    
    validates :businessAddress, presence: true

    
    has_one_attached :businessLogo

    validate :image_type

    private

    def image_type
        if businessLogo.attached? == false
            errors.add(:'business Logo', "is missing!")
        end
        if businessLogo.attached? != false
            if !businessLogo.content_type.in?(%('image/jpeg image/png image/jpg'))
                errors.add(:'business Logo', "needs to be a jpeg, jpg or png!")
            end
        end
        
    end

    default_scope { order(created_at: :desc) }
end
