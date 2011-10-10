require 'active_support'
require 'active_record'

module ActiveRecord
  class Base
    class << self
      def extend_attribute(attr, options = {}, &block)
        after_initialize ExtendAttribute.new(attr, options, block)
        after_find       ExtendAttribute.new(attr, options, block)
      end
    end

    class ExtendAttribute

      def initialize(attr, options = {}, block = nil)
        @attr = attr
        @options = options
        @block = block
      end

      def after_initialize(record)
        modules = [*@options[:extend]].compact
        modules << Module.new(&@block) if @block
        modules.each do |mod|
          attribute = record.send(@attr)
          unless attribute.is_a? Fixnum
            attribute.extend mod
          else
            Fixnum.send(:include, mod)
          end
        end
      end
      alias :after_find :after_initialize

    end
  end
end