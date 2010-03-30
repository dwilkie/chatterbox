require 'spec_helper'

describe Chatterbox do
  describe "notify" do
    context "called with a block" do
      it "should publish the notification with skip_publishers => true" do
        Chatterbox.should_receive(:publish_notice).with(hash_including(:config => {:skip_publishers => true}))
        Chatterbox.notify({}) do |via|
        end
      end
      it "should publish the notification with the key for the publisher configuration options set to the publisher name" do
        Chatterbox.should_receive(:publish_notice).with(hash_including("Publisher" => {:some_configuration_option => "example"}))
        Chatterbox.notify({}) do |via|
          via["Publisher"] = {:some_configuration_option => "example"}
        end
      end
      it "should also accept the publishers name as a symbol" do
        Chatterbox.should_receive(:publish_notice).with(hash_including("Publisher" => {:some_configuration_option => "example"}))
        Chatterbox.notify({}) do |via|
          via[:publisher] = {:some_configuration_option => "example"}
        end
      end
    end
    context "called without a block" do
      it "should not publish the notification with skip_publishers" do
        Chatterbox.should_not_receive(:publish_notice).with(hash_including(:config => {:skip_publishers => true}))
        Chatterbox.notify("message")
      end
    end
  end
end

