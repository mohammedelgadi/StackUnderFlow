class UrlMappings {

	static mappings = {
        "/$controller/$action?/$id?(.$format)?"{
            constraints {

            }
        }

        "/"(controller: 'index', action: 'index', view:'/index/index')
        "500"(view:'/error')
	}
}
