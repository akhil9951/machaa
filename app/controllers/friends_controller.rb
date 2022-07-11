class FriendsController < ApplicationController
  load_and_authorize_resource
  before_action :set_friend, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, except: [:index, :show]
  before_action :correct_user, only: [:edit, :update, :distroy]
  caches_page   :index, :show
  caches_action :index, :show

  # GET /friends or /friends.json
  def index
    @q = Friend.ransack(params[:q])
    @friends = @q.result(distnict: true).page params[:page]


    respond_to do |format|
      format.html
      format.csv { send_data @friends.to_csv,filename: "friends.csv"}
        end

  end

  # GET /friends/1 or /friends/1.json
  def show

  end

  # GET /friends/new
  def new
    #@friend = Friend.new
    @friend = current_user.friends.build
  end

  # GET /friends/1/edit
  def edit
  end

  # POST /friends or /friends.json
  def create
    #@friend = Friend.new(friend_params)
    @friend = current_user.friends.build(friend_params)
    @friend.user_id = current_user.id
    respond_to do |format|
      if @friend.save
        CrudNotificationMailer.create_notification(@friend).deliver_now
        format.html { redirect_to friend_url(@friend), notice: "Friend was successfully created." }
        format.json { render :show, status: :created, location: @friend }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @friend.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /friends/1 or /friends/1.json
  def update
    respond_to do |format|
      if @friend.update(friend_params)
        CrudNotificationMailer.update_notification(@friend).deliver_now
        format.html { redirect_to friend_url(@friend), notice: "Friend was successfully updated." }
        format.json { render :show, status: :ok, location: @friend }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @friend.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /friends/1 or /friends/1.json
  def destroy
    CrudNotificationMailer.delete_notification(@friend).deliver_now
    @friend.destroy

    respond_to do |format|
      format.html { redirect_to friends_url, notice: "Friend was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def correct_user
    @friend = current_user.friends.find_by(id: params[:id])
    redirect_to friends_path,notice: "not authorized to this friend" if@friend.nil?
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_friend
      @friend = Friend.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def friend_params
      binding.pry
      params.require(:friend).permit(:first_name, :last_name, :email, :phone_no,:user_id,:image)
    end
end
