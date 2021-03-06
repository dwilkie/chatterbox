require 'action_mailer'

module Chatterbox::Services
  class Email
    class Mailer < ActionMailer::Base
      self.template_root = File.join(File.dirname(__FILE__), *%w[views])

      def self.reloadable?() false end

      def message(data={})
        data = data.dup.symbolize_keys
    
        content_type data[:config][:content_type] || "text/plain" 

        recipients data[:config][:to]
        from       data[:config][:from]

        reply_to   data[:config][:reply_to] if data[:config][:reply_to]
        bcc        data[:config][:bcc] if data[:config][:bcc]
        cc         data[:config][:cc] if data[:config][:cc]
      
        subject    [data[:config][:summary_prefix], data[:summary]].join
        body       data[:body] if data[:body]
      end
      
    end
  end
end