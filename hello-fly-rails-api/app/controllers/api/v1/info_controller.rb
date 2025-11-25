module Api
  module V1
    class InfoController < ApplicationController
      def show
        render json: {
          app: 'hello-fly-rails-api',
          framework: 'Rails',
          rails_version: Rails.version,
          ruby_version: RUBY_VERSION,
          api_version: 'v1',
          type: 'API only',
          database: false
        }
      end
    end
  end
end
