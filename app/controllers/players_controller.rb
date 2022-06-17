class PlayersController < ApplicationController
  before_action :set_player, only: %i[show update destroy]

  def index
    @players = Player.all
  end

  def show; end

  def create
    @player = Player.new(player_params)

    if @player.save
      render :show, status: :created, location: @player
    else
      render json: @player.errors, status: :unprocessable_entity
    end
  end

  def update
    if @player.update(player_params)
      render :show, status: :ok, location: @player
    else
      render json: @player.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @player.destroy
  end

  private

  def set_player
    @player = Player.find(params[:id])
  end

  def player_params
    params.require(:player).permit(:name, :email, :cellphone, :group)
  end
end
