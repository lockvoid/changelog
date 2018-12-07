class NoticesController < ApplicationController
  before_action :set_notice, only: [:show, :edit, :update, :destroy]

  # GET /notices
  def index
    @notices = Notice.all
  end

  # GET /notices/1
  def show
  end

  def new
    @release = Release.find params[:release_id]
    @notice = @release.notices.build body: Notice::BODY_TEMPLATE

    respond_to do |format|
      format.js
    end
  end

  def edit
    respond_to do |format|
      format.js
    end
  end

  def create
    @release = Release.find params[:release_id]
    @notice = @release.notices.build notice_params

    respond_to do |format|
      if @notice.save
        format.js
      else
        format.js { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @notice.update(notice_params)
        format.js
      else
        format.js { render :edit }
      end
    end
  end

  def destroy
    @notice.destroy

    respond_to do |format|
      format.js
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_notice
    @notice = Notice.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def notice_params
    params.require(:notice).permit(:heading, :body, :trigger_element_css_selector)
  end
end
