require 'spec_helper'

RSpec.describe RailsNamespacePathHelper::Railtie do

  context "Combustion" do

    it "has ApplicationController defined" do
      expect(Object.const_defined? "ApplicationController").to be true 
    end

    it "has TestController defined" do
      expect(Object.const_defined? "TestController").to be true 
    end

    it "has Admin::TestController defined" do
      expect(Object.const_defined? "Admin::TestController").to be true 
    end

    it "has Static::TestController defined" do
      expect(Object.const_defined? "Static::TestController").to be true 
    end

  end

  context "Combustion::RailsNamespacePathHelper" do
    
    it "extends ActionController::Base" do
      expect(ActionController::Base.respond_to? :has_namespaced_paths).to be true
    end
  
    it "extends arbitrary children of ActionController::Base" do
      class TestClass < ActionController::Base; end
      expect(TestClass.respond_to? :has_namespaced_paths).to be true
    end

    it "extends ApplicationController" do
      expect(ApplicationController.respond_to? :has_namespaced_paths).to be true
    end

    it "declares paths when invoked" do
      instance = Admin::TestController.new
      expect(instance.admin_test_url).to eq('admin_test_url')
      expect(instance.test_url).to eq('admin_test_url')
    end

    it "does not pollute other namespaces" do 
      instance = Static::TestController.new
      expect(instance.static_test_url).to eq('static_test_url')
      expect{instance.test_url}.to raise_error(NoMethodError)
    end

    it "declares paths for nested namespaces" do
      instance = Admin::Static::TestController.new
      expect(instance.admin_static_test_url).to eq('admin_static_test_url')
      expect(instance.test_url).to eq('admin_static_test_url')
    end
  end


end
