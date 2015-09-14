require 'rails_helper'

RSpec.describe Post, type: :model do
  before do
    @post = Post.new(content: "First Post")
  end

  subject { @post }

  describe "when content is not present" do
    before { @post.content = " " }
    it { should_not be_valid }
  end
end
