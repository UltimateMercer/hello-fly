module Api
  module V1
    class InfoController < ApplicationController
      def show
        render json: {
          app: 'hello-fly-rails-postgres',
          framework: 'Rails',
          rails_version: Rails.version,
          ruby_version: RUBY_VERSION,
          api_version: 'v1',
          type: 'API with PostgreSQL',
          database: {
            adapter: ActiveRecord::Base.connection.adapter_name,
            version: ActiveRecord::Base.connection.select_value('SELECT version()'),
            connected: true
          }
        }
      rescue StandardError => e
        render json: {
          app: 'hello-fly-rails-postgres',
          framework: 'Rails',
          rails_version: Rails.version,
          ruby_version: RUBY_VERSION,
          api_version: 'v1',
          type: 'API with PostgreSQL',
          database: {
            connected: false,
            error: e.message
          }
        }
      end
    end
  end
end
