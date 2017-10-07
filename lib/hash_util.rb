require 'hash_util/version'
require 'byebug'
require 'hash_helper'

# Ruby Hash utility module
module HashUtil
  extend HashHelper

  # adds hash2 value to hash1 value recursively
  # alternate implementation using a string instead of hash
  # can be found in hash helper module
  def self.add_hash2_to_hash1(a1, b1)
    if a1.class.name == 'Array'
      add_hash_if_array(a1, b1)
    elsif a1.class.name == 'Hash'
      add_hash_if_hash(a1, b1)
    else
      a1[k] += b1[k]
    end
  end

  #  set all values in the hash to 0
  #  This method should be moved to helper module and
  #  another genericmethod called set_Values to be added
  #  that can set all values including zero
  #  TODO optimize
  #  FIXME rubocop
  def self.zero(obj)
    if obj.class.name == 'Array'
      obj = obj.collect do |m|
        %w[Array Hash].include?(m.class.name) ? zero(m) : 0
      end
    elsif obj.class.name == 'Hash'
      obj.each do |k, _v|
        obj[k] = if %w[Array Hash].include?(obj[k].class.name)
                   zero(obj[k])
                 else
                   0
                 end
      end
    else
      obj[k] = 0
    end
  end

  # copies values from a hash string in to another
  # The 2 hashes should be of same structure but keys
  # can be different
  # FIXME rubocop
  def self.merge(hash_str1, hash_str2)
    # extract nums, words
    token1 = hash_str1.scan(/[[+-]?([0-9]*[.])?[0-9e-]+]+|\w+|[{}\[\]:,"\040]/)
    token2 = extract_numbers_hash(hash_str2)
    j = 0
    token1.each_index do |i|
      begin
        # used Float instead of to_f as to_f converts string to '0'
        Float token1[i]
        token1[i] = token2[j]
        j += 1
      rescue
      end
    end
    token1.join.gsub(/\s+/, ' ')
  end
end
