# frozen_string_literal: true

require_relative "rails_namespace_path_helper/version"

module RailsNamespacePathHelper

  # This function dynamically creates aliases for any helpers present in @helper_types
  # eg. in Admin:TasksController, tasks_url becomes an alias for admin_tasks_url

  # These functions are declared locally on the controller so there will not be any conflicts 

  def has_namespaced_paths
    
    HELPER_TYPES = ['url','path']

    model = self.name.split("::")[-1].gsub("Controller","").downcase
    namespaces = self.name.split("::")[0...-1].join("_").downcase

    HELPER_TYPES.each do |t|
      self.define_method("#{model.singularize}_#{t}".to_sym) do |*args|
        self.send("#{namespaces}_#{model.singularize}_#{t}".to_sym,*args)
      end
      self.define_method("#{model.pluralize}_#{t}".to_sym) do 
        self.send("#{namespaces}_#{model.pluralize}_#{t}".to_sym)
      end
    end

  end

end
