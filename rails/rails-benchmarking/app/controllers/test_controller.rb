class TestController < ApplicationController

  def create
    id = params[:restaurant_id]
    sleep 8.0/1000 # Simulate an auth SQL query
  end

end