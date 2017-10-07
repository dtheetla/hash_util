# HashUtil

Hash utility methods.

1) add_hash2_to_hash1 => This adds hash2 values with hash1. Both Hash1 and Hash2
should be of same structure

2) zero => This sets all values of a hash to 0

3) merge => Overrides hash1 values with hash2 values

4) tokenize => tokenizes a hash and returns a flat array

5) extract_numbers_hash => extracts numbers from a hash             

* works with new hash syntax

* Works with hashes that have numbers as values

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'hash_util'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install hash_util

## Usage

(1)add_hash2_to_hash1
```ruby
require 'hash_util'
hash1 = {a:1,b:2,c:[1,2],d:{a:1}}
hash2 = {a:3,b:3,c:[3,2],d:{a:10}}
hash3 =  HashUtil.add_hash2_to_hash1(hash1,hash2) # hash1 = hash3 = {a:4,b:5,c:[4,4],d:{a:11}}
```
(2) zero
```ruby
hash1 = {a:1,b:2,c:[1,2],d:{a:1}}
HashUtil.zero(hash1) #{a:0,b:0,c:[0,0],d:{a:0}}
```
(3) merge
```ruby
   str1 = %{
        { "OccExp": [ -0.0004, 0.09600, 0.0000, -0.0204, 0.09 ,"abc":{"a":1,"b":0,"c":[0,1,2]} ],
          "PremRV": [ 8.500, 4.19999981, 5.0, 7.80 ]}
        }    

    str2 = %{
        { "OccExp": [ 0.0250000004, 0.0, 0.023, 0.0250000004, 0.0280000009,
          "abc":{"a":1,"b":0,"c":[0,1,2]}  ], "PremRV": [ 8.5, 4.19999981, 5.5,
          7.80000019 ]}
      }
    str1 =  HashUtil.merge(str1,str2) # values in str1 == str2
```
(4) tokenize
```ruby
 str2 = %{
          { "OccExp": [ 0.0250000004, 0.0199999996, "abc":{"a":1,"b":0,"c":[0,1,2]}]}
        }
 HashUtil.extract_numbers_hash(str2) #[ 0.0250000004, 0.0199999996,1,0,0,1,2]
```
(5) extract_numbers_hash
```ruby
    str2 = %{
        { "OccExp": [ 0.0250000004, 0.0199999996, "abc":{"a":1,"b":0,"c":[0,1,2]}]}
      }
    HashUtil.extract_numbers_hash(str2) #[ 0.0250000004, 0.0199999996,1,0,0,1,2]  

```



## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/dtheetla/hash_util. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the HashUtil project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/hash_util/blob/master/CODE_OF_CONDUCT.md).
