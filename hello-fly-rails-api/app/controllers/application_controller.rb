class ApplicationController < ActionController::API
  def index
    render plain: "Hello from Rails API!\n"
  end

  def health
    render plain: "OK\n"
  end
end
