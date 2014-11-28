class HomeController < ApplicationController
  def index
    @schools = School.all
    @markers = Gmaps4rails.build_markers(@flats) do |flat, marker|
      marker.lat flat.latitude
      marker.lng flat.longitude
    end
  end
end
