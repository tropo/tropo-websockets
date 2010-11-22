%w(rubygems yaml json thread awesome_print eventmachine em-websocket lib/channels).each { |lib| require lib }

# Load the configuration
APP_CONFIG = YAML.load(File.open('./config/application.yml'))

require 'lib/websocket-server'