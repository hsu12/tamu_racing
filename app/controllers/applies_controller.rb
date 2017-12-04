class AppliesController < ApplicationController
  def new
    @apply = Apply.new
  end
    
  def create
    @apply = Apply.new(apply_params)
    if @apply.save
        flash[:success] = "#{@apply.name} was successfully created."
        User.find(@apply.user).update_column:apply0,@apply.id
        redirect_to user_path(@apply.user)
    else
        flash.now[:danger] = "You can only submit one application form"
        render 'new'
    end
  end
    
  def edit
    id = params[:id]
    @apply = Apply.find(id) # look up movie by unique ID
    if !current_user?(User.find(@apply.user_id))
      render 'home/unauthorized'
      return
    end
  end
  
  def update
    @apply = Apply.find(params[:id])
    if current_user?(User.find(@apply.user_id))
      if @apply.update(apply_params)
        flash[:success] = "#{@apply.name} was successfully changed."
        redirect_to user_path(@apply.user)
      else
        render 'edit'
      end
    else
      if @apply.update(apply_params)
        flash[:success] = "#{@apply.name} was successfully changed."
        redirect_to applies_path
      else
        render 'show'
      end
    end
  end
    
  def show
    id = params[:id]
    @apply = Apply.find(id) # look up movie by unique ID
    if (!current_user?(User.find(@apply.user_id)))&&(!current_user_manage?)
      render 'home/unauthorized'
      return
    end
    # will render app/views/movies/show.<extension> by default
  end
  
  def index
    if params[:commit]=="Refresh"
      session[:viewPreference] = params[:viewPreference]
      session[:viewNotEdit] = params[:viewNotEdit]
      session[:viewRejected] = params[:viewRejected]
      session[:applyType] = params[:applyType]
      session[:nameSearch] = params[:nameSearch]
    end
    
    @viewPreference = session[:viewPreference]
    @viewNotEdit = session[:viewNotEdit]
    @applyType = session[:applyType]
    @nameSearch = session[:nameSearch]
    @viewRejected = session[:viewRejected]
    
    if @applyType=='Seniors'
      @applies = Apply.all
    elsif @applyType=='Juniors'
      @applies = Applya.all
    else
      @applies = nil
    end
    
    if (!@applies.nil?)&&(@viewPreference=='1')
      @applies = @applies.where(admission: true)
    end
    
    if (!@applies.nil?)&&(@viewNotEdit=='1')
      @applies = @applies.where(admission: nil)
    end
    
    if (!@applies.nil?)&&(@viewRejected=='1')
      @applies = @applies.where(admission: false)
    end
    
    if (!@applies.nil?)&&(!@nameSearch.nil?)
      @applies = @applies.where("name like ? OR uin like ? OR email like ?",
                                "%#{@nameSearch}%","%#{@nameSearch}%","%#{@nameSearch}%")
    end
    
  end
  
  def destroy 
    id = params[:id]
    @apply = Apply.find(id)
    if !@apply.admission.nil?
      flash[:danger] = "You cannot delete a application form which has been processed"
      redirect_to user_path(@apply.user_id)
      return
    end
    User.find(@apply.user_id).update_column:apply0,nil
    @apply.destroy
    redirect_to user_path(@apply.user_id)
  end
  
  private
    def apply_params
      params.require(:apply).permit(:name, :uin, :cellphone, 
                                    :email, :course_fall, :course_credit_fall, :course_spring, :course_credit_spring, 
                                    :major, :GPR_major, :GPR_overall, :employement, :participate_SAE, :flag_participate_SAE,
                                    :flag_grassroots, :grassroots, :flag_SAE_officer, :SAE_officer, :flag_Other, :Other,
                                    :activities_description, :motivation, :hands_on_activities, :leadership, 
                                    :skills, :preference, :acknoledgement,:user_id,:admission,:comment)
    end
end
