require File.dirname(__FILE__) + '/../spec_helper.rb'

describe RBeautify::BlockStart do
  before(:each) do
    @ruby = RBeautify::Language.language(:ruby)
  end

  describe 'class' do
    describe '#first_common_ancestor' do
      before(:each) do
        @grand_parent =  RBeautify::BlockStart.new(@ruby.matcher(:standard), nil, 0, 0, 'class', ' Foo')
        @parent =  RBeautify::BlockStart.new(@ruby.matcher(:standard), @grand_parent, 0, 0, 'def', ' foo')
        @first = RBeautify::BlockStart.new(@ruby.matcher(:standard), @parent, 0, 0, 'def', ' foo')
        @second = RBeautify::BlockStart.new(@ruby.matcher(:standard), @parent, 0, 0, 'def', ' bar')
        @unrelated = RBeautify::BlockStart.new(@ruby.matcher(:standard), nil, 0, 0, 'class', ' Bar')
      end

      it {
        expect(RBeautify::BlockStart.first_common_ancestor(@grand_parent, nil)).to eq(nil)
      }
      it {
        expect(RBeautify::BlockStart.first_common_ancestor(@grand_parent, @unrelated)).to be_nil
      }
      it {
        expect(RBeautify::BlockStart.first_common_ancestor(@grand_parent, @parent)).to eq(@grand_parent )
      }
      it {
        expect(RBeautify::BlockStart.first_common_ancestor(@grand_parent, @first)).to eq(@grand_parent )
      }
      it {
        expect(RBeautify::BlockStart.first_common_ancestor(@first, @second)).to eq(@parent)
      }
    end
  end

  describe '#strict_ancestor_of?' do
    before(:each) do
      @block = RBeautify::BlockStart.new(@ruby.matcher(:standard), nil, 0, 'def', ' foo', 0)
    end

    it { expect(@block).to_not be_strict_ancestor_of(nil) }
    it { expect(@block).to_not be_strict_ancestor_of(@block) }
    it { expect(@block).to_not be_strict_ancestor_of(RBeautify::BlockStart.new(@ruby.matcher(:if), nil, 0, 0, 'if', ' foo') ) }
    it { expect(@block).to be_strict_ancestor_of(RBeautify::BlockStart.new(@ruby.matcher(:if), @block, 0, 0, 'if', ' foo') ) }
  end

  describe '#total_indent_size' do
    before(:each) do
      @block = RBeautify::BlockStart.new(@ruby.matcher(:standard), nil, 0, 'def', ' foo', 0)
    end

    it {
      expect(RBeautify::BlockStart.new(@ruby.matcher(:standard), nil, 0, 0, 'def', ' foo').total_indent_size).to eq(2)
    }

    it 'should sum with parents total indent size' do
      parent = double('parent_start_block', :total_indent_size => 4)
      expect(RBeautify::BlockStart.new(@ruby.matcher(:standard), parent, 0, 0, 'def', ' foo').total_indent_size).to eq(6)
    end
  end

end
