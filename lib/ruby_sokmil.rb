# frozen_string_literal: true

require_relative "ruby_sokmil/version"
require_relative "ruby_sokmil/client"

module RubySokmil
  class Error < StandardError; end

  def self.new(options = {})
    RubySokmil::Client.new(options)
  end
end
