require File.dirname(__FILE__) + '/../helper.rb'
require 'revok'
require 'core/framework'

describe Revok::Framework, "basic framework" do

	before do
		@framework = Revok::Framework.new
		@framework.init_module_path
	end

	it "has a default modules directory" do
		Revok::DATASTORE["ModulesPath"].should_not == nil
	end

	it "can load a module" do
		@framework.load_module(File.dirname(__FILE__) + "/ab_module/", "ab_module_pass.rb")
		@framework.modules_loaded.include?("ab_module_pass").should be_true
	end

	it "can create a instance of module" do
		@framework.init_module(Revok::Modules.constants[0])
		Revok::MODULES["TestModule_Pass"].should_not be_nil
	end

	context "when load modules from a directory" do
		before do
			Revok::DATASTORE["ModulesPath"] = File.dirname(__FILE__) + "/ab_module"
			Revok::MODULES.clear
			@framework.load_modules
		end
		
		it "can load all valid modules" do
			@framework.modules_loaded.length.should == 6
		end

		it "can skip and diaplay invalid modules" do
			@framework.load_error_modules.length.should == 1
		end
		
		it "can create all instances of modules" do
			@framework.init_modules
			Revok::MODULES.length.should == 4
		end
	end

end
