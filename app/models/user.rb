class User < ActiveRecord::Base
	attr_accessor   :password
	attr_accessible :name, :email, :password, :password_confirmation

	email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

	validates :name,  :presence => true
	validates :name,  :length   => { :maximum => 50 }
	validates :email, :presence => true
	validates :email, :format   => { :with => email_regex }
	validates :email, :uniqueness => { :case_sensitive => false }
	validates :password, :presence => true
	validates :password, :confirmation => true,
						 :length => { :within => 6..40 }
end
