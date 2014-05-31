class MembersController < ApplicationController
  before_action :set_member, only: [:show, :edit, :update, :destroy]
  skip_before_filter :verify_authenticity_token, only: [:create, :update]
  respond_to :html, :js
  
  # GET /members
  # GET /members.json
  def index
    @members = Member.all
  end

  # GET /members/1
  # GET /members/1.json
  def show
  end

  # GET /members/new
  def new
    @member = Member.new
  end

  # GET /members/1/edit
  def edit
     @member = Member.find(params[:id])
  end

  # POST /members
  # POST /members.json
  def create
     @member = Member.new(member_params)
     respond_to do |format|
          if @member.save
              format.html{
                  if params[:member][:image].present?
                    render :crop
                  end   
              }
              format.js {render :crop}
              
              
          else
            format.html { render :action => "new" }
            format.js
          end
        end
  end

  # PATCH/PUT /members/1
  # PATCH/PUT /members/1.json
  def update
    @member.update(member_params)
      respond_to do |format|
         if @member.save
            format.html{
               render :crop
          }
          format.js{}
        end
      end
  end

  # DELETE /members/1
  # DELETE /members/1.json
  def destroy
    @member.destroy
    respond_to do |format|
      format.html { redirect_to members_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_member
      @member = Member.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def member_params
      params.require(:member).permit(:name, :image, :image_crop_x, :image_crop_y, :image_crop_w, :image_crop_h,:body)
    end
end
