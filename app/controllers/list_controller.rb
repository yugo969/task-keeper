class ListController < ApplicationController
  # respond_to :html, :js, :json
  before_action :set_list, only: %i(edit update destroy)
  
  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    if @list.save
      redirect_to :root
    else
      @list.valid?
      render action: :new
    end
  end
  
  def edit

  end
  
  def update
    # @list.update_attributes(list_params)
    # respond_with @list, :location => root_path
    
    # if @list.update_attributes(list_params)
      
    #   redirect_to :root
    # else
    #   @list.valid?
    #   render action: :edit
    # end
    
    respond_to do |format|
      if @list.update_attributes(list_params)
        format.html { redirect_to(:root, notice: "リスト名を変更しました。") }
        format.json { respond_with_bip(@list) }
      else
        @list.valid?
        format.js { render action: :edit }
        format.json { respond_with_bip(@list) }
      end
    end
    
  end
  
  
  def destroy
    @list.destroy
    redirect_to :root
  end
  
  
  private
    def list_params
      params.required(:list).permit(:title).merge(user: current_user)
    end
    
    def set_list
      @list = List.find_by(id: params[:id])
    end
    
end
