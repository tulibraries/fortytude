# frozen_string_literal: true

module Admin
  class BlogsController < Admin::ApplicationController
    def sync_all
      SyncService::Blogs.call
      flash[:notice] = t("manifold.admin.notification.all_blogs_synced")
      redirect_to admin_blogs_path
    end

    def sync
      blog = Blog.find(params[:blog_id])
      SyncService::Blogs.call(blog: blog)
      flash[:notice] = t(
        "fortytude.admin.notification.blog_synced",
        title: blog.title,
        id: blog.id
      )
      redirect_to admin_blogs_path
    end
  end
end
