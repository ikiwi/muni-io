class Route < ActiveRecord::Base
	has_many :line_items
	has_many :stops, :through => :line_items

	before_destroy :ensure_not_referenced_by_any_line_item

	validates :r_id, :r_desc, :presence => true

	private
    # ensure that there are no line items referencing this product
    def ensure_not_referenced_by_any_line_item
      if line_items.empty?
        return true
      else
        errors.add(:base, 'Line Items present')
        return false
      end
	end
	def route_params
    	params.require(:route).permit(:r_id, :r_desc)
  	end
end
