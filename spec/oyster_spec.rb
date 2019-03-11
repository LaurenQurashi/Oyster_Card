require 'oyster'

describe Oyster do
  it "dosen't have a balance bigger than 0 when initialized" do
    expect(subject.balance).to eq 0
  end
end
