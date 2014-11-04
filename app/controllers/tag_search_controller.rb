class TagSearchController < ApplicationController
   def index

   end
   def find
	@bubbles = Bubble.where(:tag => params[:tag])
	@tag = params[:tag]
   end
end