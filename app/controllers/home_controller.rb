class HomeController < ApplicationController
  def index
    @schools = School.all
    @markers = Gmaps4rails.build_markers(@schools) do |school, marker|
      marker.lat school.latitude
      marker.lng school.longitude
    end
  end
end
