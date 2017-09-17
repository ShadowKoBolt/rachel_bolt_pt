module Admin
  class VideosController < Admin::BaseController
    def index
      @videos = Video.all
    end

    def new
      @video = Video.new
    end

    def create
      @video = Video.new(video_params)
      if @video.save
        redirect_to admin_videos_path, notice: t('.success')
      else
        render action: :new
      end
    end

    def edit
      @video = Video.friendly.find(params[:id])
    end

    def update
      @video = Video.friendly.find(params[:id])
      if @video.update(video_params)
        redirect_to admin_videos_path, notice: t('.success')
      else
        render action: :edit
      end
    end

    private

    def video_params
      params.require(:video).permit(:name, :slug, :file)
    end
  end
end
