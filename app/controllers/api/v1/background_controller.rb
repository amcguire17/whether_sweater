class Api::V1::BackgroundController < ApplicationController
  def index
    if params[:location].present?
      id = nil
      image = UnsplashFacade.search_image(params[:location])
      render json: ImageSerializer.format_data(id, image)
    else
      render json: { error: 'Params not given' }, status: :bad_request
    end
  end
end
