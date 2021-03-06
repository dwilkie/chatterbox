require 'ostruct'

module Chatterbox
  module ExceptionNotification

    # Handle the exception
    # Accepts either an exception, a hash, or an object that responds to to_s
    # * Exceptions are passed through like normal
    # * Hashes can have an :exception => exception in them, which will result in 
    #     the same treatment as a literal exception passed 
    # * Objects are simply treated as a 'summary' message were an exception may not be necessary
    def handle(args)
      hsh = normalize_to_hash(args)
      return if use_ignore_list?(hsh) && on_ignore_list?(hsh[:exception])
      hsh = Extracter.wrap(hsh)
      hsh = RailsExtracter.wrap(hsh)
      hsh = Presenter.render(hsh)
      Chatterbox.notify(hsh)
    end

    def normalize_to_hash(args)
      case
      when Exception === args then           { :exception => args }
      when args.respond_to?(:to_hash) then   args.to_hash
      when args.respond_to?(:to_s) then      { :summary => args.to_s }
      end
    end
    
    # Check to see if we should use ignore list for this exception - 
    # first use the value from the passed in options, otherwise
    # use the configuration value (which defaults to true)
    def use_ignore_list?(hsh)
      return hsh[:use_ignore_list] if hsh.key?(:use_ignore_list)
      configuration.use_ignore_list
    end
    
    def on_ignore_list?(exception)
      ignored = configuration.ignore.include?(exception.class) || 
                configuration.ignore.include?(exception.class.to_s)
      log_ignored_exception(exception) if ignored
      ignored
    end
    
    def log_ignored_exception(exception)
      Chatterbox.logger.debug { %[Chatterbox::ExceptionNotification ignoring exception: "#{exception.inspect}" as its on the ignore list] }
    end

    # Default configuration for ExceptionNotification
    #   :ignore => array of exceptions to ignore by default
    #   :use_ignore_list => whether to use the ignore list - 
    #     defaults to true, and can be overidden on per exception level
    def configuration
      @configuration ||= OpenStruct.new(
        :ignore => default_ignored_exceptions,
        :use_ignore_list => true)
    end
    
    # Configure ExceptionNotification
    # ex:
    #   Chatterbox::ExceptionNotification.configure do |config|
    #      config.ignore << MyOwnExceptionToIgnore
    #   end
    def configure
      yield(configuration)
    end
    
    # Default exceptions that ExceptionNotification will ignore
    def default_ignored_exceptions
      ['ActiveRecord::RecordNotFound', 'ActionController::RoutingError',
       'ActionController::InvalidAuthenticityToken', 'ActionController::UnknownAction',
       'CGI::Session::CookieStore::TamperedWithCookie' ]
    end
    
    extend self
    
  end
end

require 'chatterbox/exception_notification/extracter'
require 'chatterbox/exception_notification/rails_extracter'
require 'chatterbox/exception_notification/presenter'