class GeojsonBuilder
  def build_event(locale, geojson)
    geojson << {
      type: "Feature",
      geometry: {
        type: "Point",
        coordinates: [locale.longitude, locale.latitude] # this part is tricky
      },
      properties: {
        title: locale.title,
        address: locale.address,
        :"marker-color" => "#FFFFFF",
        :"marker-symbol" => "circle",
        :"marker-size" => "medium",
      }
    }
  end
end
