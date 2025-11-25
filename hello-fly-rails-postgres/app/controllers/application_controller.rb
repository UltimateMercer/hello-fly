class ApplicationController < ActionController::API
  def index
    render plain: "Hello from Rails with PostgreSQL!\n"
  end

  def health
    render plain: "OK\n"
  end

  def db_health
    begin
      # Check database connection
      ActiveRecord::Base.connection.execute("SELECT 1")
      render json: { status: "ok", message: "Database connection is healthy" }
    rescue StandardError => e
      render json: { status: "error", message: "Database connection failed: #{e.message}" }, status: :service_unavailable
    end
  end
end
