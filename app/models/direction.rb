class Direction < ActiveRecord::Base
	has_many :line_items, :dependent => :destroy

	validates :d_id, :d_desc, :presence => true

private
  def direction_params
    params.require(:direction).permit(:d_id, :d_desc)
  end
end
