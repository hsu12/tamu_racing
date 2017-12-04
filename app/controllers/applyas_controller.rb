class ApplyasController < ApplicationController
    
  def new
    @applya = Applya.new
  end
    
  def create
    @applya = Applya.new(applya_params)
    if @applya.save
        flash[:success] = "#{@applya.name} was successfully created."
        User.find(@applya.user_id).update_column:apply1,@applya.id
        redirect_to user_path(@applya.user_id)
    else
        flash.now[:danger] = "You can only submit one application form"
        render 'new'
    end
  end
    
  def edit
    id = params[:id]
    @applya = Applya.find(id) # look up movie by unique ID
    if (!current_user?(User.find(@applya.user_id)))
      render 'home/unauthorized'
      return
    end
  end
  
  def update
    @applya = Applya.find(params[:id])
    if current_user?(User.find(@applya.user_id))
      if @applya.update(applya_params)
        flash[:success] = "#{@applya.name} was successfully changed."
        redirect_to user_path(@applya.user_id)
      else
        render 'edit'
      end
    elsif current_user_manage?
      if @applya.update(applya_params)
        flash[:success] = "#{@applya.name} was successfully changed."
        redirect_to applies_path
      else
        render 'show'
      end
    end
  end
    
  def show
    id = params[:id]
    @applya = Applya.find(id) # look up movie by unique ID
    if (!current_user?(User.find(@applya.user_id)))&&(!current_user_manage?)
      render 'home/unauthorized'
      return
    end
    # will render app/views/movies/show.<extension> by default
  end
  
  def index
    if params[:applyType]=='A'
      @applyas = Apply.all
    else
      @applyas = nil
    end
    
    if (!@applyas.nil?)&&(params[:viewPreference]=='1')
      @applyas = @applyas.where(admission: true)
    end
    
    if (!@applyas.nil?)&&(params[:viewNotEdit]=='1')
      @applyas = @applyas.where(admission: nil)
    end
  end
  
  def destroy 
    id = params[:id]
    @applya = Applya.find(id)
    if !@applya.admission.nil?
      flash[:danger] = "You cannot delete a application form which has been processed"
      redirect_to user_path(@applya.user_id)
      return
    end
    User.find(@applya.user_id).update_column:apply1,nil
    @applya.destroy
    redirect_to user_path(@applya.user_id)
  end
  
  private
    def applya_params
      params.require(:applya).permit(:name,:uin,:email,:course_401,
         :FSAE_interest,:FSAE_as_senoir,:FSAE_experience,:sub_team,
         :current_course,:user_id,:comment,:admission)
    end
end
