class User < ActiveRecord::Base
    has_secure_password
    
    #Validates :email, presence: true, uniqueness: true
end
