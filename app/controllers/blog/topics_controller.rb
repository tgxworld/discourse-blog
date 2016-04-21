module Blog
  class TopicsController < Blog::ApplicationController
    def index
      respond_to do |format|
        format.html do
          @topics = visible_topics.by_newest
        end
      end
    end

    protected

    def visible_topics
      Topic.secured.visible.listable_topics
        .where("not exists(select c.topic_id from categories c where c.topic_id = topics.id)")
    end

  end
end
