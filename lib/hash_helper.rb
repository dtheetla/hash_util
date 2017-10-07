require 'hash_util/version'
require 'byebug'

# Ruby Hash utility module
module HashHelper

  def tokenize(str)
    # extract words + nums
    str.scan(/[0-9.e-]+|\w+/)
  end

  # extracts all numbers in a hash string
  def extract_numbers_hash(str)
    str = tokenize str
    # extract all nums including those using e notation
    str.select! { |m| /^[0-9.e-]+$/.match m }
    # used Float instead of to_f as to_f converts to string '0'
    str.collect do |m|
      Float m
    end
  end

  # submethod used by add_hash2_to_hash1 if type Array
  def add_hash_if_array(a1, b1)
    a1 = a1.enum_for(:each_with_index).collect do |m, index|
      if %w[Array Hash].include?(m.class.name)
        add_hash2_to_hash1(a1[index], b1[index])
      else
        m + b1[index]
      end
    end
    a1
  end

  # submethod used by add_hash2_to_hash1 if type Hash
  def add_hash_if_hash(a1, b1)
    a1.each do |k, _v|
      if %w[Array Hash].include?(a1[k].class.name)
        a1[k] = add_hash2_to_hash1(a1[k], b1[k])
      else
        a1[k] += b1[k]
      end
    end
  end

  # adds up hash2 values in to hash1
  # alternate implementation using string instead of hash

  # def self.add_hash2_to_hash1(hash1, hash2)
  #   token1 = hash1.to_s.scan(/[[+-]?([0-9]*[.])?[0-9e-]+]+|\w+|[{}\[\]:,"\040]/)
  #   token2 = extract_numbers_hash(hash2.to_s)
  #   j = 0
  #   token1.each_index do |i|
  #     begin
  #       Float token1[i]
  #       b = Float token2[j]
  #       token1[i] = token1[i].to_f + b
  #       j += 1
  #     rescue => e
  #       e.backtrace
  #     end
  #   end
  #   token1.join.gsub(/\s+/, ' ').gsub(/[.0]/, '')
  # end
end
