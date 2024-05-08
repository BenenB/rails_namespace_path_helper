
module RailsNamespacePathHelper
  # with thanks to: 'Gary S. Weaver'
  # https://stackoverflow.com/questions/11348332/how-can-i-extend-applicationcontroller-in-a-gem
  class Railtie < Rails::Railtie
    initializer "rails_namespace_path_helper.action_controller" do 
    ActiveSupport.on_load(:action_controller) do
      extend RailsNamespacePathHelper
    end
  end
end