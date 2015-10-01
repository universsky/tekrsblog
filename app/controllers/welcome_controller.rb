class WelcomeController < ApplicationController
	before_action :all_comments, only: [:index, :about]
	def index		
		@articles=Article.all
	end

	def about
	end

	def all_comments
   	   @comments = Comment.all.reverse_order
	end

end
