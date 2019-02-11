class Admin::BadgesController < Admin::BaseController
  before_action :find_badge, only: %i[show edit update destroy]

  def index
    @badges = Badge.all
  end

  def show; end

  def new
    @badge = Badge.new
  end

  def create
    @badge = Badge.new(badge_params)

    if @badge.save
      redirect_to admin_badge_path(@badge)
    else
      render :new
    end
  end

  def edit; end

  def update
    if @badge.update(badge_params)
      redirect_to admin_badge_path(@badge)
    else
      render :edit
    end
  end

  def destroy
    @badge.destroy
    redirect_to admin_badges_path
  end

  def render_form_control
    render partial: "admin/badges/form_controls/#{params[:check_type]}" if Badge.check_types.key?(params[:check_type])
  end

  private

  def badge_params
    params.require(:badge).permit(:name, :description, :image_url, :check_type, :param)
  end

  def find_badge
    @badge = Badge.find(params[:id])
  end
end
