require 'spec_helper'

module Gherkin
  module Parser
    describe Parser do
      it "should raise when feature doesn't parse" do
        p = Parser.new(mock('formatter').as_null_object)
        lambda do
          p.parse("Feature: f\nFeature: f", __FILE__, __LINE__-1)
        end.should raise_error(/Parse error at/)
      end

      it "should raise when steps don't parse" do
        p = Parser.new(mock('formatter').as_null_object, true, 'steps', false)
        lambda do
          p.parse("", __FILE__, __LINE__-1)
        end.should raise_error(/Parse error at/)
      end
    end
  end
end