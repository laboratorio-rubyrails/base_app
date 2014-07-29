# encoding: utf-8
module ApplicationHelper

	def titulo_base(titulo_pagina)
		titulo = "Mi aplicación"
		if titulo_pagina.empty?
			titulo
		else
			"#{titulo} | #{titulo_pagina}"
		end
	end
end
