class Admin::TestController < ApplicationController  
  def admin_test_url
    'admin_test_url'
  end 

  has_namespaced_paths
end