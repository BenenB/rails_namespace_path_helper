require 'spec_helper'

RSpec.describe RailsNamespacePathHelper do
  it "extends ActionController" do
    expect(ActionController.respond_to? :has_namespaced_paths).to be true
  end
end
