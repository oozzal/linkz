class LinksController < ApplicationController
  def home
  end

  def index
    render json: Link.find_each.map(&:host)
  end

  def create
    params[:hosts].each do |host|
      Link.find_or_create_by(host: host)
    end
    render nothing: true, status: 200
  end
end

