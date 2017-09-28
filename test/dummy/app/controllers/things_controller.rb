class ThingsController < ApplicationController
  def create
    render json: formatted_params(create_params, :importantAttribute)
  end

  private

  def create_params
    params.require(:thing).permit(:importantAttribute)
  end

  def formatted_params(whitelist, *attrs)
    'goo'
  end
end
