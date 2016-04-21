# name: discourse-blog
# about: Blog plugin for Discourse
# version: 0.1
# authors: Alan Tan

::BLOG_HOST = Rails.env.development? ? "tgxworld.localhost" : "insidethesourcecode.com"

Rails.application.config.assets.precompile += ['blog.css', 'foundation.css']

module ::Blog
  class Engine < ::Rails::Engine
    engine_name "blog"
    isolate_namespace Blog
  end
end

after_initialize do
  class BlogConstraint
    def matches?(request)
      request.host == BLOG_HOST
    end
  end

  Discourse::Application.routes.prepend do
    mount ::Blog::Engine, at: "/", constraints: BlogConstraint.new
  end
end
