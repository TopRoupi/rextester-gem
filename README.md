# rextester-gem

interface for rextester api

# instalation

```bash
gem install rextester
```

```ruby
#gemfile
gem 'rextester'
```

# initialize Rextester

args:

- lang_id
id of code's language, a list of ids is avaliable on https://rextester.com/main
- code
- input
- compiler_args

# #run

return the output of the code execution, and sets additional attributes like errors and warnings

# exemple

```ruby
require 'rextester'

code = Rextester.new code: 'p "hello world"'
p code.run
p code.result
p code.errors
p code.warnings
p code.run_time # in seconds max of 5
p code.mem_peak # in mb max of 1250
```
