class Admin::BadgesController < Admin::BaseController
  before_action :set_badge, only: %i[show edit update destroy]

  def index
    @badges = Badge.all
  end

  def new
    @badge = Badge.new
  end

  def show; end

  def edit; end

  def create
    @badge = Badge.new(badge_params)
    @badge.body = badge_params[:criterion] + '.png'

    if @badge.save
      redirect_to admin_badge_path(@badge), notice: t('.success')
    else
      render :new
    end
  end

  def update
    @badge.body = badge_params[:criterion] + '.png'
    if @badge.update(badge_params)

      redirect_to admin_badge_path(@badge), notice: t('.success')
    else
      render :edit
    end
  end

  def destroy
    @badge.destroy
    redirect_to admin_badges_path, notice: t('.success')
  end

  private
  def set_badge
    @badge = Badge.find(params[:id])
  end

  def badge_params
    params.require(:badge).permit(:title, :criterion)
  end
end
