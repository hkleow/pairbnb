class UsersController < ApplicationController
	before_action :require_login, only: [:mylistings]


	def index
		@listing = Listing.all
	end	


	def show
	end

	def edit
		
	end
 	
 	def mylistings
 		@listings = current_user.listings
  	end	

end

