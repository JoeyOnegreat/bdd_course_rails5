class User < ApplicationRecord
    validates :first, presence: true 
    validates :last, presence: true
    validates :email, presence: true
    validates :phone, presence: true

    default_scope { order(created_at: :desc) }
end
