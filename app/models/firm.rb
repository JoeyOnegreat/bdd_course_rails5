class Firm < ApplicationRecord
    validates :name, presence: true 
    validates :trn, presence: true
    validates :email, presence: true
    validates :phone, presence: true
    validates :address, presence: true

    default_scope { order(created_at: :desc) }
end
