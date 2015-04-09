module BuyersHelper
	def render_pd_image_exist_path(f)
		if f
			image_tag f.pictures.last.image.url(:thumb)
		else
			"无图"
		end
	end
end
