require 'hash_util/version'
require 'byebug'

# Ruby Hash utility module
module HashUtil
  # adds up hash2 values in to hash1
  def self.add_hash2_to_hash1(a1, b1)
    if a1.class.name == 'Array'
      a1 = a1.enum_for(:each_with_index).collect do |m, index|
        if %w[Array Hash].include?(m.class.name)
          add_hash2_to_hash1(a1[index], b1[index])
        else
          m + b1[index]
        end
      end
      a1
    elsif a1.class.name == 'Hash'
      a1.each do |k, _v|
        if %w[Array Hash].include?(a1[k].class.name)
          a1[k] = add_hash2_to_hash1(a1[k], b1[k])
        else
          a1[k] += b1[k]
        end
      end
    else
      a1[k] += b1[k]
    end
  end

  #  set all values in the hash to 0
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
  def self.merge(hash_str1, hash_str2)
    token1 = hash_str1.scan(/[[+-]?([0-9]*[.])?[0-9e-]+]+|\w+|[{}\[\]:,"\040]/)
    token2 = extract_numbers_hash(hash_str2)
    # byebug
    j = 0
    token1.each_index do |i|
      begin
        Float token1[i]
        token1[i] = token2[j]
        j += 1
      rescue
      end
    end
    token1.join.gsub(/\s+/, ' ')
  end

  def self.tokenize(str)
    str.scan(/[0-9.e-]+|\w+/)
  end

  # extracts all numbers in a hash string
  def self.extract_numbers_hash(str)
    str = tokenize str
    str.select! { |m| /^[0-9.e-]+$/.match m }
    str.collect do |m|
      Float m
    end
  end
end
