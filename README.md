# ReadabilityExportFile [![Build Status](https://travis-ci.org/yukihir0/readability_export_file.png?branch=master)](https://travis-ci.org/yukihir0/readability_export_file)

'readability_export_file' provides feature for parsing export file of 'Readability'.

## Requirements

- ruby 1.9
- json

Add this line to your application's Gemfile:

```
gem 'readability_export_file', :github => 'yukihir0/readability_export_file'
```

And then execute:

```
% bundle install
```

## How to use

```
path = 'path/to/export_file'
item_list = ReadabilityExportFile.parse(path)

item_list.each { |item|
    puts item.article_title
}
```

For more information, please see [here](https://github.com/yukihir0/readability_export_file/blob/master/sample/main.rb).

## License

Copyright &copy; 2013 yukihir0
