require 'bike'

describe Bike do
  it { is_expected.to respond_to :working? }

  it { is_expected.to respond_to :broken }

  it 'can be reported broken' do
    subject.broken
    expect(subject).to be_broken
  end
end
