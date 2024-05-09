# frozen_string_literal: true

RSpec.describe RailsNamespacePathHelper do
  it "has a version number" do
    expect(RailsNamespacePathHelper::VERSION).not_to be nil
  end

  it "exposes helper generation methods" do
    class TestController
      extend RailsNamespacePathHelper
    end

    expect(TestController.respond_to? :has_namespaced_paths).to be true
    expect(TestController.respond_to? :has_namespaced_path_singular).to be true
    expect(TestController.respond_to? :has_namespaced_path_plural).to be true
  end

  context "should fail if" do
    it "has no helper to alias" do
      class A
        class TestController
          extend RailsNamespacePathHelper
          has_namespaced_paths
        end
      end

      instance = A::TestController.new

      expect(instance.respond_to? :test_url).to be false
      expect(instance.respond_to? :test_path).to be false

      expect(instance.respond_to? :tests_url).to be false
      expect(instance.respond_to? :tests_path).to be false
    end

    it "already has the alias defined" do
      class B
        class TestController
          extend RailsNamespacePathHelper
          def b_test_url; return 'b_test_url'; end
          def b_tests_url; return 'b_tests_url'; end
          def b_test_path; return 'b_test_path'; end
          def b_tests_path; return 'b_tests_path'; end

          def test_url; return 'test_url'; end
          def tests_url; return 'tests_url'; end

          def test_path; return 'test_path'; end
          def tests_path; return 'tests_path'; end

          has_namespaced_paths
        end
      end

      instance = B::TestController.new

      expect(instance.test_url).to eq 'test_url'
      expect(instance.tests_url).to eq 'tests_url'

      expect(instance.test_path).to eq 'test_path'
      expect(instance.tests_path).to eq 'tests_path'

    end
  end

  context "should succeed if" do
    it "has all prerequisites" do       
      class C
        class TestController
          extend RailsNamespacePathHelper
          def c_test_url; return 'c_test_url'; end
          def c_tests_url; return 'c_tests_url'; end
          def c_test_path; return 'c_test_path'; end
          def c_tests_path; return 'c_tests_path'; end
          has_namespaced_paths
        end
      end      

      instance = C::TestController.new

      expect(instance.test_url).to eq 'c_test_url'
      expect(instance.tests_url).to eq 'c_tests_url'

      expect(instance.test_path).to eq 'c_test_path'
      expect(instance.tests_path).to eq 'c_tests_path'

    end

    it "aliases are present but raise errors" do
      class D
        class TestController
          extend RailsNamespacePathHelper
          def d_test_url; return 'd_test_url'; end
          def d_tests_url; return 'd_tests_url'; end
          def d_test_path; return 'd_test_path'; end
          def d_tests_path; return 'd_tests_path'; end

          def test_url; raise StandardError; end
          def tests_url; raise StandardError; end

          def test_path; raise StandardError; end
          def tests_path; raise StandardError; end

          has_namespaced_paths
        end
      end

      instance = D::TestController.new

      expect(instance.test_url).to eq 'd_test_url'
      expect(instance.tests_url).to eq 'd_tests_url'

      expect(instance.test_path).to eq 'd_test_path'
      expect(instance.tests_path).to eq 'd_tests_path'

    end

  end
end
