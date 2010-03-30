require 'spec_helper'

describe Chatterbox::Services::Email do
  describe "self.deliver" do
    context "skip_publishers => true" do
      context "the email service configuration is provided in the options" do
        it "should create a new email object and call deliver on it" do
          service = mock("Chatterbox::Services::Email")
          Chatterbox::Services::Email.should_receive(:new).and_return(service)
          service.should_receive(:deliver)
          Chatterbox::Services::Email.deliver("Chatterbox::Services::Email" => {:some_config => "example"}, :config=>{:skip_publishers => true})
        end
      end
      context "the email service configuration is ommitted from the options" do
        it "should not create a new email object" do
          Chatterbox::Services::Email.should_not_receive(:new)
          Chatterbox::Services::Email.deliver("SomeOtherService" => {:some_config => "example"}, :config=>{:skip_publishers => true})
        end
      end
    end
  end
end

