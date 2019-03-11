require 'oyster'

describe Oyster do

  it "doesn't have a balance bigger than 0 when initialized" do
    expect(subject.balance).to eq 0
  end

  it " .top_up" do
    subject.top_up(20)
    expect(subject.balance).to eq 20
  end 

end
