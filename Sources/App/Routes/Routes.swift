import Vapor

extension Droplet {
    func setupRoutes() throws {
        get("hello") { req in
            var json = JSON()
            try json.set("hello", "world")
            return json
        }

        get("sergio") { req in
            return "Hello, world!"
        }
        
        get("calculate") { req in
            var json = JSON()
            try json.set("value", ["x" : 1.0, "y" : 2.0 ])
            return json
        }
        

        // response to requests to /info domain
        // with a description of the request
        get("info") { req in
            return req.description
        }

        get("description") { req in return req.description }
        
        try resource("posts", PostController.self)
    }
}
