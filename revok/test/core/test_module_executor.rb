require File.dirname(__FILE__) + '/../helper.rb'
require 'revok'
require 'core/framework'
require 'core/module_executor'

describe Revok::ModuleExecutor, "execute modules" do
	before do
		@framework = Revok::Framework.new
		@framework.init_module_path
		Revok::DATASTORE["ModulesPath"] = File.dirname(__FILE__) + "/ab_module"
		@framework.load_modules
		@framework.init_modules
		@executor = Revok::ModuleExecutor.new
		@executor.gen_exec_list_all
	end

	it "generates a list to execute all modules" do
		puts @executor.exec_list.to_s
		@executor.exec_list.should_not be_nil
	end

	it "executes modules that specified by exec list" do
		status = @executor.execute
		status.should be_true
	end

	it "should not write or read the origin modules list"
	it "should not write the execute list"
end
