# coding: utf-8
require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe ReadabilityExportFile do
    context 'uninitialized' do
        describe '#initialize' do
            context 'when nil file path input' do
                it 'raise error' do
                    expect { ReadabilityExportFile.new(nil)
                    }.to raise_error(RuntimeError, ReadabilityExportFile::INVALID_FILE_PATH_ERROR)
                end
            end

            context 'when null string file path input' do
                it 'raise error ' do
                    expect { ReadabilityExportFile.new('')
                    }.to raise_error(RuntimeError, ReadabilityExportFile::INVALID_FILE_PATH_ERROR)
                end
            end

            context 'when not exist file path input' do
                it 'raise error' do
                    expect { ReadabilityExportFile.new('spec/data/not_exist_file')
                    }.to raise_error(RuntimeError, ReadabilityExportFile::NOT_EXISTS_FILE_ERROR)
                end
            end

            context 'when valid path input' do
                it 'not raise error' do
                    expect { ReadabilityExportFile.new('spec/data/test.json')
                    }.to_not raise_error
                end
            end
        end
    end

    context 'initialized' do
        before(:each) do
            @file = ReadabilityExportFile.new('spec/data/test.json')
        end 

        describe '#get_items' do
            context 'when call' do
                it '3 items' do
                    items = @file.get_items
                    items.length.should == 3
                end
            end
        end

        describe '#parse' do
            context 'when json input' do
                it 'parse item' do
                    item_list = @file.send(:parse, 'spec/data/test.json')

                    item_list.length.should == 3

                    item1 = item_list[0]
                    item1.article_url.should     == 'http://test01.json/'
                    item1.date_added.should      == '2013-02-01T01:23:45'
                    item1.archive.should         be_false
                    item1.date_archived.should   == nil
                    item1.favorite.should        be_false
                    item1.date_favorited.should  == nil
                    item1.article_excerpt.should == 'test article excerpt 01'

                    item2 = item_list[1]
                    item2.article_url.should     == 'http://test02.json/'
                    item2.date_added.should      == '2013-02-01T01:23:45'
                    item2.archive.should         be_true
                    item2.date_archived.should   == '2013-03-01T01:23:45'
                    item2.favorite.should        be_false
                    item2.date_favorited.should  == nil
                    item2.article_excerpt.should == 'test article excerpt 02'

                    item3 = item_list[2]
                    item3.article_url.should     == 'http://test03.json/'
                    item3.date_added.should      == '2013-02-01T01:23:45'
                    item3.archive.should         be_true
                    item3.date_archived.should   == '2013-03-01T01:23:45'
                    item3.favorite.should        be_true
                    item3.date_favorited.should  == '2013-04-01T01:23:45'
                    item3.article_excerpt.should == 'test article excerpt 03'
                end
            end
        end
    end
end