require_dependency "discourse"

module Blog
  class ApplicationController < ActionController::Base
    include CurrentUser
    layout "blog_application"
  end
end
