## RailsNamespacePathHelper
## An extension for namespaced controllers

Namespacing is a common pattern in rails, however...
Rails does not account for namespacing when looking for helpers on controllers
  - eg. for Admin::TasksController
    - helpers are declared 'admin_tasks_url' 
    - however rails bolierplate expects 'tasks_url' to be available

This gem dynamically creates aliases for these methods so that nothing needs to be reconfigured

### Usage

To use:
  - add `extend RailsNamespacePathHelper` to the top of ApplicationController
  - then call `has_namespaced_paths` at the top of each controller with a namespace

Like this:
```
# controllers/application_controller.rb
class ApplicationController < ActionController::Base
  extend RailsNamespacePathHelper
  
  ...

end

# controllers/admin/tasks_controller.rb
class Admin::TasksController < ApplicationController
  has_namespaced_paths

  ...

end
```
### Installation

Install the gem and add to the application's Gemfile by executing:

  $ bundle add UPDATE_WITH_YOUR_GEM_NAME_IMMEDIATELY_AFTER_RELEASE_TO_RUBYGEMS_ORG

If bundler is not being used to manage dependencies, install the gem by executing:

  $ gem install UPDATE_WITH_YOUR_GEM_NAME_IMMEDIATELY_AFTER_RELEASE_TO_RUBYGEMS_ORG


### Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/rails_namespace_path_helper.

### License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
