class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def index
  	@txt = params[:txt] if params[:txt].present?
  end

  def read
  	file = params[:picture]
  	img = RTesseract.new(file.path)
  	@txt = img.to_s
  	redirect_to :controller => "application", :txt => @txt
  end

end
