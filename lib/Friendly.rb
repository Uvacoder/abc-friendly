$:.unshift mydir = File.dirname(__FILE__)

require 'i18n'
I18n::Backend::Simple.send(:include, I8n::Backend::Fallbacks)
I18n.load_path = Dir[File.join(mydir, 'locales', '*.yml')]
I18n.default_locale = "en-us"

require "friendly/address"
require "friendly/company"
require "friendly/internet"
require "friendly/lorem"
require "friendly/name"
require "friendly/phone_number"
require "friendly/version"
require "extension/array"

module Friendly
    class Config
        def self.locale=(locale)
            I18n.locale = locale
        end
    end

    def self.numerify(number_string)
        number_string.gsub(/#/) { rand(10).to_s }
    end

    def self.letterify(letter_string)
        letter_string.gsub(/\?/) { ('a'..'z').to_a.rand }
    end

    def self.bothify(string)
        self.letterify(self.numerify(string))
    end
end
