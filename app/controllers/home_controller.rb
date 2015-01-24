class HomeController < ApplicationController
  def index
    if params[:locality]
      @schools = School.search(params[:locality])
    else
    @schools = School.order("created_at DESC")
    end
    @schools = School.all
    @markers = Gmaps4rails.build_markers(@schools) do |school, marker|
      marker.lat school.latitude
      marker.lng school.longitude
    end
  end
end
