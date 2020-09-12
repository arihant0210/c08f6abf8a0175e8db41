class HomeController < ApplicationController
	def index
		if params[:search_term].present?
			term = "%#{params[:search_term].downcase}%"
			@shows = Show.joins(:channel).where('channels.name LIKE (?) or shows.name LIKE (?) ', term, term)
		else	
			@shows = Show.includes(:channel)
		end
	end

	def add_favourite
		if current_user.favourite_shows.create(show_id: params[:show_id])
			flash[:notice]	= "Favourite Added Successfully"	 
		else
			flash[:notice]	= "Error in adding Favourite"	 
		end
		redirect_to root_path
	end

	def remove_favourite
		favourite = current_user.favourite_shows.find_by(show_id: params[:show_id])
		if favourite.destroy
				flash[:alert]	= "Favourite Remove Successfully"	 
		else
		  flash[:alert]	= "Error in removing Favourite"	 		
    end
		redirect_to root_path
	end
end
