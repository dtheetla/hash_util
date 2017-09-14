# HashUtil

Hash utility methods.
1)add_hash2_to_hash1 => This adds hash2 values with hash1. Both Hash1 and Hash2
should be of same structure

2)zero => This sets all values of a hash to 0

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

(1)add_hash2_to_hash1(hash1,hash2)
```ruby
hash1 = {a:1,b:2,c:[1,2],d:{a:1}}
hash2 = {a:3,b:3,c:[3,2],d:{a:10}}
hash3 = HashUtil.add_hash2_to_hash1(hash1,hash2) # {a:4,b:5,c:[4,4],d:{a:11}}
```
(2) zero
```ruby
hash1 = {a:1,b:2,c:[1,2],d:{a:1}}
HashUtil.zero(hash1) #{a:0,b:0,c:[0,0],d:{a:0}}
```
## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/dtheetla/hash_util. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the HashUtil project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/hash_util/blob/master/CODE_OF_CONDUCT.md).
