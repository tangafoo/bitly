class UrlsController < ApplicationController
  def index
    @url = Url.all
  end

  def show
    @url = Url.find(params[:id])
  end

  def new
    @url = Url.new
  end

  def edit
    @url = Url.find(params[:id])
  end

  def create
    @url = Url.new(long_url: url_params[:long_url], short_url: rand(36**4).to_s(36))
    if @url.save
      redirect_to @url
    else
      render 'new'
    end
  end

  def update
    @url = Url.find(params[:id])

    if @url.update(url_params)
      redirect_to url_path
    else
      render 'edit'
    end
  end

  def destroy
    @url = Url.find(params[:id])
    @url.destroy
    redirect_to urls_path
  end

  def short
    @url = Url.find(params[:id])
    redirect_to @url.long_url
  end

  private
  def url_params
    params.require(:url).permit(:long_url)
  end
end
