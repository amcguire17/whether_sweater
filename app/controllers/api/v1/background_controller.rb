# frozen_string_literal: true

module Api
  module V1
    class BackgroundController < ApplicationController
      def index
        if params[:location].present?
          image = BackgroundFacade.search_image(params[:location])
          render json: ImageSerializer.format_data(image)
        else
          render json: { error: 'Params not given' }, status: :bad_request
        end
      end
    end
  end
end
