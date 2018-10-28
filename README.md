# apachelogregex.cr


ApacheLogRegex.cr is a crystal lang port of weppos's apachelogregex gem. 
It provides functionalities to parse a line from an Apache log file into a hash.

## Installation

Add this to your application's `shard.yml`:

```yaml
dependencies:
  apachelogregex.cr:
    github: a3104/apachelogregex.cr
```

## Usage

```crystal
require "apachelogregex"
```


The following one is the most simple example usage. It tries to parse the `access.log` file and echoes each parsed line.

```

format = %{%h %l %u %t \"%r\" %>s %b \"%{Referer}i\" \"%{User-Agent}i\"}
parser = ApacheLogRegex.new(format)

File.each_line("/var/apache/access.log") do |line|
  parser.parse(line)
  # {"%r"=>"GET /blog/index.xml HTTP/1.1", "%h"=>"87.18.183.252", ... }
end
```

More often, you might want to collect parsed lines and use them later in your program. The following example iterates all log lines, parses them and returns an array of Hash with the results.

```
format = '%h %l %u %t \"%r\" %>s %b \"%{Referer}i\" \"%{User-Agent}i\"'
parser = ApacheLogRegex.new(format)

File.readlines('/var/apache/access.log').collect do |line|
  parser.parse(line)
  # {"%r"=>"GET /blog/index.xml HTTP/1.1", "%h"=>"87.18.183.252", ... }
end
```


## Contributing

1. Fork it (<https://github.com/your-github-user/apachelogregex.cr/fork>)
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## Contributors

- [a3104](https://github.com/a3104) abe - creator, maintainer
