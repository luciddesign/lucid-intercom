require_relative './attributes/user'
require_relative './attributes/company'
require_relative './attributes/custom'

module Lucid
  module Intercom
    class Attributes
      #
      # @see Lucid::Intercom::Attributes::Base#initialize
      #
      def initialize(*args)
        @args = args
      end

      #
      # @return [Hash]
      #
      def user
        user_browser.select { |k, _| k != :user_hash }
      end

      #
      # User attributes for browser (with 'user_hash').
      #
      # @return [Hash]
      #
      def user_browser
        User.new(*@args).()
      end

      #
      # @return [Hash]
      #
      def company
        Company.new(*@args).()
      end

      #
      # Company attributes for browser (expects 'id', not 'company_id').
      #
      # @return [Hash]
      #
      def company_browser
        company2 = company
        company2[:id] = company2.delete(:company_id)
        company2
      end

      #
      # @return [Hash]
      #
      def custom
        Custom.new(*@args).()
      end
    end
  end
end
