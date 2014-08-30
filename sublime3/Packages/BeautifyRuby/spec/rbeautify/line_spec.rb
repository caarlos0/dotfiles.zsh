require File.dirname(__FILE__) + '/../spec_helper.rb'

describe RBeautify::Line do

  describe '#format' do
    let(:config) do
      {
        'tab_size' => 2,
        'translate_tabs_to_spaces' => 'true'
      }
    end

    before(:each) do
      @language = double(RBeautify::Language)
    end

    it 'should just strip with empty stack' do
      expect(RBeautify::BlockMatcher).to receive(:parse).and_return(nil)
      expect(RBeautify::Line.new(@language, ' a = 3 ', 0, config).format).to eq("a = 3")
    end

    it 'should indent with existing indent' do
      current_block = double('block_start',
        :total_indent_size => 2,
        :format_content? => true,
        :strict_ancestor_of? => false
      )
      expect(RBeautify::BlockStart).to receive(:first_common_ancestor).at_least(1).and_return(current_block)
      expect(RBeautify::BlockMatcher).to receive(:parse).and_return(current_block)
      expect(RBeautify::Line.new(@language, ' a = 3 ', 0, current_block, config).format).to eq('  a = 3')
    end

    it 'leave empty lines blank' do
      current_block = double('block_start', :format_content? => true)
      expect(RBeautify::BlockMatcher).to receive(:parse).and_return(current_block)
      expect(RBeautify::Line.new(@language, '    ', 0, current_block, config).format).to eq('')
    end

    it 'should remove indent with match to end of block' do
      current_block = double('block_start',
        :format_content? => true,
        :indent_end_line? => false
      )
      expect(RBeautify::BlockStart).to receive(:first_common_ancestor).at_least(1).and_return(nil)
      expect(RBeautify::BlockMatcher).to receive(:parse).and_return(nil)
      expect(RBeautify::Line.new(@language, '  end ', 0, current_block, config).format).to eq('end')
    end

    it 'should not remove indent with match to end of block if indent_end_line? is true' do
      current_block = double('block_start',
        :total_indent_size => 2,
        :format_content? => true,
        :indent_end_line? => true
      )
      expect(RBeautify::BlockMatcher).to receive(:parse).and_return(nil)
      expect(RBeautify::Line.new(@language, '  end ', 0, current_block, config).format).to eq('  end')
    end

    it 'should leave indent at old stack level with match of new block' do
      current_block = double('current_block_start',
        :total_indent_size => 2,
        :format_content? => true
      )
      new_block = double('new_block_start',
        :format_content? => true,
        :strict_ancestor_of? => false
      )
      expect(RBeautify::BlockStart).to receive(:first_common_ancestor).at_least(1).and_return(current_block)
      expect(RBeautify::BlockMatcher).to receive(:parse).and_return(new_block)
      expect(RBeautify::Line.new(@language, 'class Foo', 0, current_block, config).format).to eq('  class Foo')
    end

    it 'should remove indent if a block ends and starts' do
      current_block = double('current_block_start',
        :total_indent_size => 0,
        :format_content? => true
      )
      new_block = double('new_block_start',
        :format_content? => true,
        :strict_ancestor_of? => false
      )
      expect(RBeautify::BlockStart).to receive(:first_common_ancestor).at_least(1).and_return(current_block)
      expect(RBeautify::BlockMatcher).to receive(:parse).and_return(new_block)
      expect(RBeautify::Line.new(@language, '   else   ', 0, current_block, config).format).to eq('else')
    end

    it 'should not change when format is false' do
      current_block = double('block_start', :format_content? => false)
      expect(RBeautify::BlockMatcher).to receive(:parse).and_return(current_block)
      expect(
        RBeautify::Line.new(
          @language,
          ' some content after program has finished. ', 0,
          current_block,
          config
        ).format
      ).to eq(" some content after program has finished. ")
    end

    it 'should leave indent with match to end of block (but no format)' do
      current_block = double('block_start',
        :format_content? => false
      )
      expect(RBeautify::BlockMatcher).to receive(:parse).and_return(nil)
      expect(RBeautify::Line.new(@language, '  "', 0, current_block, config).format).to eq('  "')
    end

  end

end
