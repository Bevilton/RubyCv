require 'rspec'
require_relative 'cv01'

describe Fibonacci do 
  subject (:fibonacci) {Fibonacci.new}
  describe "#current" do
    let(:user){User.new}
    
    before do
    end

    after do
    end

    context "when object fibonacci was not called yet" do
      it "returns the current number" do
        expect(fibonacci.current).to eq(1)
      end
    end
  end
end