class LineItem < ActiveRecord::Base
	belongs_to :route
	belongs_to :direction
	belongs_to :stop

private
  def ib_line_item_params
    params.require(:line_item).permit(:r_id, :d_id, :s_id)
  end
end
