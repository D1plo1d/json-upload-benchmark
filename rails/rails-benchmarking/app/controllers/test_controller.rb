class TestController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def create
    id = params[:restaurant_id]
    sleep 8.0/1000 # Simulate an auth SQL query
    render nothing: true
  end

end