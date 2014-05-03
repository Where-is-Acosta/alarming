class User < ActiveRecord::Base
	has_many :alarms
  	has_secure_password validations: false

	    validates :password, presence: true, on: :create
	    validates_length_of :password, minimum: 6, on: :create
	    validates_confirmation_of :password, on: :create





end
