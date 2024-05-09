class Admin::Static::TestController < ApplicationController  
  def admin_static_test_url
    'admin_static_test_url'
  end 

  has_namespaced_paths
end