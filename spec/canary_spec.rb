require 'canary'

describe Canary do
  describe '.puts' do
    let(:message) { 'My hovercraft is full of eels' }
    it 'prints a string correctly' do
      expect($stdout).to receive(:puts).with("\e[33m *  *  *  *  *  *  *  *  *  * String is My hovercraft is full of eels  *  *  *  *  *  *  *  *  *  * \n\e[0m")
      described_class.puts message
    end
  end
end
