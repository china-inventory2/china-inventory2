class ImagesController < ApplicationController
  def create
    @image = Image.new(image_params)
    @image.save
    redirect_to users_path
  end

  private

    def image_params
      params.require(:image).permit(:name)
    end
end
