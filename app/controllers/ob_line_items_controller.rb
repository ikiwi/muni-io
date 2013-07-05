class ObLineItemsController < ApplicationController
  before_action :set_ob_line_item, only: [:show, :edit, :update, :destroy]

  # GET /ob_line_items
  # GET /ob_line_items.json
  def index
    @ob_line_items = ObLineItem.all
  end

  # GET /ob_line_items/1
  # GET /ob_line_items/1.json
  def show
  end

  # GET /ob_line_items/new
  def new
    @ob_line_item = ObLineItem.new
  end

  # GET /ob_line_items/1/edit
  def edit
  end

  # POST /ob_line_items
  # POST /ob_line_items.json
  def create
    @ob_line_item = ObLineItem.new(ob_line_item_params)

    respond_to do |format|
      if @ob_line_item.save
        format.html { redirect_to @ob_line_item, notice: 'Ob line item was successfully created.' }
        format.json { render action: 'show', status: :created, location: @ob_line_item }
      else
        format.html { render action: 'new' }
        format.json { render json: @ob_line_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ob_line_items/1
  # PATCH/PUT /ob_line_items/1.json
  def update
    respond_to do |format|
      if @ob_line_item.update(ob_line_item_params)
        format.html { redirect_to @ob_line_item, notice: 'Ob line item was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @ob_line_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ob_line_items/1
  # DELETE /ob_line_items/1.json
  def destroy
    @ob_line_item.destroy
    respond_to do |format|
      format.html { redirect_to ob_line_items_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ob_line_item
      @ob_line_item = ObLineItem.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ob_line_item_params
      params.require(:ob_line_item).permit(:route_id, :direction_id, :stop_id)
    end
end
