class User < ApplicationRecord
	has_secure_password validations: false
	#la validité de l'email (il doit etre present et unique)
	validates_uniqueness_of :email, presence: true
	#has_secure_password 
	
end
