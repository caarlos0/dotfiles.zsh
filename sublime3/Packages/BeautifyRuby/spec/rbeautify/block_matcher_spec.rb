require File.dirname(__FILE__) + '/../spec_helper.rb'

describe RBeautify::BlockMatcher do

  describe 'class' do
    describe '#parse' do
      before(:each) do
        @ruby = RBeautify::Language.language(:ruby)
      end

      it 'should not match de' do
        expect(RBeautify::BlockMatcher.parse(@ruby, nil, 0, 'de foo', 0)).to eq(nil)
      end

      it 'should match def' do
        block = RBeautify::BlockMatcher.parse(@ruby, nil, 0, 'def foo', 0)
        expect(block).to_not eq(nil)
        expect(block.name).to eq(:standard)
      end

      it 'should be nested block' do
        block = RBeautify::BlockMatcher.parse(@ruby, nil, 0, 'if {', 0)
        expect(block).to_not eq(nil)
        expect(block.name).to eq(:curly_bracket)
        expect(block.parent).to_not eq(nil)
        expect(block.parent.name).to eq(:if)
      end

      it 'should be nested block (taking into account ends)' do
        block = RBeautify::BlockMatcher.parse(@ruby, nil, 0, 'if {}', 0)
        expect(block).to_not eq(nil)
        expect(block.name).to eq(:if)
      end

      it 'should be deeply nested block (taking into account ends)' do
        block = RBeautify::BlockMatcher.parse(@ruby, nil, 0, 'def foo(bar = {})', 0)
        expect(block).to_not eq(nil)
        expect(block.name).to eq(:standard)
        expect(block.parent).to eq(nil)
      end

      it 'should current block if no started or ended blocks' do
        block = RBeautify::BlockStart.new(@ruby.matcher(:standard), nil, 0, 0, 'def', ' foo')
        expect(RBeautify::BlockMatcher.parse(@ruby, block, 0, 'a = 3', 0)).to eq(block)
      end

      it 'should be newly started block if ends and starts' do
        current_block = RBeautify::BlockStart.new(@ruby.matcher(:if), nil, 0, 0, 'if', ' foo')
        block = RBeautify::BlockMatcher.parse(@ruby, current_block, 0, 'else', 0)
        expect(block).to_not eq(nil)
        expect(block.name).to eq(:if)
        expect(block.parent).to eq(nil)
      end

      it 'should be parent block if current block ends' do
        parent_block = RBeautify::BlockStart.new(@ruby.matcher(:standard), nil, 0, 0, 'class', ' Foo')
        child_block = RBeautify::BlockStart.new(@ruby.matcher(:standard), parent_block, 0, 0, 'def', ' foo')
        expect(RBeautify::BlockMatcher.parse(@ruby, child_block, 0, 'end', 0)).to eq(parent_block)
      end

      it 'should remove two blocks if top of stack ends implicitly' do
        parent_block = RBeautify::BlockStart.new(@ruby.matcher(:case), nil, 0, 0, 'case', ' foo')
        child_block = RBeautify::BlockStart.new(@ruby.matcher(:inner_case), parent_block, 0, 0, 'when', '2')
        expect(RBeautify::BlockMatcher.parse(@ruby, child_block, 0, 'end', 0)).to eq(nil)
      end
    end
  end

  describe '#can_nest?' do
    before(:each) do
      @language = double(RBeautify::Language)
    end

    it {
      expect(RBeautify::BlockMatcher.new(@language, :foo, /foo/, /bar/)).to be_can_nest(nil)
    }

    it {
      expect(RBeautify::BlockMatcher.new(@language, :foo, /foo/, /bar/)).to be_can_nest(double('block_start', :parse_content? => true))
    }

    it {
      expect(RBeautify::BlockMatcher.new(@language, :foo, /foo/, /bar/)).to_not be_can_nest(double('block_start', :parse_content? => false))
    }

    it {
      expect(RBeautify::BlockMatcher.new(@language, :foo, /foo/, /bar/, :nest_except => [:bar])).to be_can_nest(nil)
    }

    it {
      expect(RBeautify::BlockMatcher.new(@language, :foo, /foo/, /bar/, :nest_except => [:foo])).to be_can_nest(double('block_start', :name => :bar, :parse_content? => true))
    }

    it {
      expect(RBeautify::BlockMatcher.new(@language, :foo, /foo/, /bar/, :nest_except => [:foo])).to_not be_can_nest(double('block_start', :name => :bar, :parse_content? => false))
    }

    it {
      expect(RBeautify::BlockMatcher.new(@language, :foo, /foo/, /bar/, :nest_except => [:bar])).to_not be_can_nest(double('block_start', :name => :bar, :parse_content? => true))
    }
  end

end
