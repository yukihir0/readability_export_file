# coding: utf-8
require 'readability_export_file/version'
require 'json'
require 'entity/readability_item'

module ReadabilityExportFile
    NIL_FILE_PATH_ERROR   = 'nil or empty file path ins inputted'
    NOT_EXISTS_FILE_ERROR = 'file is not exists'
    INVALID_DATA_ERROR    = 'json data is invalid'
    
    class << self
       include Entity

       public
        def parse(path)
            raise NIL_FILE_PATH_ERROR if is_nil_or_empty?(path)
            raise NOT_EXISTS_FILE_ERROR unless File.exists?(path)

            json = get_json_from_file(path)
            json.inject(Array.new) { |items, data|
                item = ReadabilityItem.new
                data.each { |key, value|
                    case key
                    when 'article__excerpt'
                        item.article_excerpt = value
                    when 'favorite'
                        item.favorite = value
                    when 'date_archived'
                        item.date_archived = value
                    when 'article__url'
                        item.article_url = value
                    when 'date_added'
                        item.date_added = value
                    when 'date_favorited'
                        item.date_favorited = value
                    when 'article__title'
                        item.article_title = value
                    when 'archive'
                        item.archive = value
                    else
                        raise INVALID_DATA_ERROR
                    end
                }
                items << item
            }
        end

        private
        def is_nil_or_empty?(path)
            path.nil? || path.empty?
        end

        def get_json_from_file(path)
            file = File.open(path, 'r').read
            JSON.parse(file)
        end
    end
end
