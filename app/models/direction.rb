class Direction < ActiveRecord::Base
	has_many :line_items, :dependent => :destroy

	validates :r_id, :ib_id, :ib_desc, :ob_id, :ob_desc, :presence => true

private
  def direction_params
    params.require(:direction).permit(:d_id, :d_desc)
  end
end
