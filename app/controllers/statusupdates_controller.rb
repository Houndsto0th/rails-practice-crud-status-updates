class StatusupdatesController < ApplicationController
  before_action :set_statusupdate, only: [:show, :edit, :update, :destroy]
  def index
    @statusupdates = Statusupdate.all
  end

  def new
    @statusupdate = Statusupdate.new
  end

  def show
    @statusupdate = Statusupdate.find(params[:id])
  end

  def create
    @statusupdate = Statusupdate.new(statusupdate_params)
    if @statusupdate.save
      redirect_to statusupdates_path, notice: "Status created"
    else
      render :new
    end
  end

  def edit
    @statusupdate = Statusupdate.find(params[:id])
  end

  def destroy
    @statusupdate.destroy
      redirect_to statusupdates_path, notice: "Status deleted"
  end

  def update
    if @statusupdate.update(statusupdate_params)
      redirect_to statusupdates_path, notice: "Status updated"
    else
      render :edit
    end
  end


  private
    def set_statusupdate
      @statusupdate = Statusupdate.find(params[:id])
    end

    def statusupdate_params
      params.require(:statusupdate).permit(:status, :user, :likes)
    end
end
