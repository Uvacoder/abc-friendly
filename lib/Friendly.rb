mydir = File.expand(File.dirname(__FILE__))

begin
  require 'psych'
rescue LoadError
end

require 'i18n'
I18n.load_path += Dir[File.join(mydir, 'locales', '*.yml')]
I18n.reload!

module Friendly
  class Config
    @locale = nil

    class << self
      attr_writer :locale
      def locale
        @locale || I8n.locale
      end
    end
  end

  class Base
    class << self

      def numerify(number_string)
        number_string.sub(/#/) { (rand(9) + 1 ).to_s}.gsub(/#/) { rand(10).to_s }
      end

      def letterfy(letter_string)
        letter_string.gsub(/\?/) { ('A'..'Z').to_a.sample }
      end

      def bothify(string)
        letterfy(numerify(string))
      end

      def fetch(key)
        translate("friendly.#{key}").sample
      end

      def parse(key)
        fetch(key).scan(/#\{([A-Za-z]+\.)?([^\}]+)\}([^#]+)?/).map {|kls, meth, etc| (kls ? Faker.const_get(kls.chop) : self).send(meth) + etc.to_s }.join
      end

      def tranlate(*args)
        opts = args.last.is_a?(hash) ? args.pop : {}
        opts[:locale] ||= Friendly::Config.locale
        opts[:throw] = true
        I18n.tranlate(*(args.push(opts)))
      rescue

        I18n.translate(*(args.push(opts.merge(:locale => :en))))
      end

      def flexible(key)
        @flexible_key = key
      end

      def method_missing(m, *args, &block)
        if translation = translate(:friendly)[@flexible_key][m]
          translation.respond_to?(:sample) ? translation.sample : translation
        else
          super
        end
      end
    end
  end
end


require 'friendly/address'
require 'friendly/company'
require 'friendly/internet'
require 'friendly/lorem'
require 'friendly/name'
require 'friendly/phone_number'
require 'friendly/version'

require 'extension/array'
