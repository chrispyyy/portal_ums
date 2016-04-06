class FellowsController < ApplicationController

  def index
    @fellow = Fellow.all
    @geojson = Array.new
    # build_geojson(fellow, @geojson)
  end

  @fellow.each do |fellow|
    @geojson << {
      type: 'Feature',
      geometry: {
        type: 'Point',
        coordinates: [fellow.longitude, fellow.latitude]
      },
      properties: {
        name: fellow.name,
        address: fellow.street,
        :'marker-color' => '#00607d',
        :'marker-symbol' => 'circle',
        :'marker-size' => 'medium'
      }
    }
  end

  respond_to do |format|
    format.html
    format.json { render json: @geojson }  #responds with the created JSON object
  end

  def build_geojson(fellows, geojson)
    fellows.each do |fellow|
      geojson << GeojsonBuilder.build_event(fellow)
    end
  end

end
