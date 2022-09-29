class RouteFacade

  def self.route_time(start_location, end_location)
    json = MapService.route(start_location, end_location)
    json[:route][:realTime]
  end
end