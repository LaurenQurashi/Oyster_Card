require 'oyster'

describe Oyster do

  it "doesn't have a balance bigger than 0 when initialized" do
    expect(subject.balance).to eq 0
  end

  context "topping up" do

    it ".top_up" do
      subject.top_up(20)
      expect(subject.balance).to eq 20
      # expect(subject.top_up).to change {subject.balance}.by(20)
    end

    it "stops topping up if balance reached maximum limit: 90" do
      subject.top_up(Oyster::MAXIMUM_LIMIT)
      expect {subject.top_up(1)}.to raise_error "Can't top up: Maximum limit of #{Oyster::MAXIMUM_LIMIT} reached"
    end
  end

end
