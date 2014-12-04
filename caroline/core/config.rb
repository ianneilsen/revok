module Revok

	class Config
		MODULES_DIR = File.expand_path("../modules", File.dirname(__FILE__))
		MSG_QUEUE_USER = ENV["MSG_QUEUE_USER"] != nil ? ENV["MSG_QUEUE_USER"] : "user"
		MSG_QUEUE_PASSWORD = ENV["MSG_QUEUE_PASSWORD"] != nil ? ENV["MSG_QUEUE_PASSWORD"] : "p@ssword"
		MSG_QUEUE_HOST = ENV["MSG_QUEUE_HOST"] != nil ? ENV["MSG_QUEUE_HOST"] : "127.0.0.1"
		MSG_QUEUE_PORT = ENV["MSG_QUEUE_PORT"] != nil ? ENV["MSG_QUEUE_PORT"] : "61612"
		MSG_QUEUE_CERT_PATH = ENV["MSG_QUEUE_CERT_PATH"] != nil ? ENV["MSG_QUEUE_CERT_PATH"] : ""
		WORK_QUEUE = "/queue/work"
		RETURN_QUEUE = "/queue/return"
	end

end