require 'rails_helper'

RSpec.describe Post, type: :model do
  before do
    @post = Post.new(title: "First Post")
  end

  subject { @post }

  describe "when title is not present" do
    before { @post.title = " " }
    it { should_not be_valid }
  end
end
