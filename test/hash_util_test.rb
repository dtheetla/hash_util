require 'test_helper'

class HashUtilTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::HashUtil::VERSION
  end

  def test_it_adds_hash2_to_hash1
    hash1 = { a: 1, b: 2, c: [1, 2], d: { a: 1 } }
    hash2 = { a: 3, b: 3, c: [3, 2], d: { a: 10 } }
    hash3 = { a: 4, b: 5, c: [4, 4], d: { a: 11 } }
    assert_equal hash3, HashUtil.add_hash2_to_hash1(hash1, hash2)
    assert_equal hash1, hash3
  end

  def test_it_sets_zeros_in_the_hash
    hash1 = { a: 1, b: 2, c: [1, 2], d: { a: 1 } }
    hash2 = { a: 0, b: 0, c: [0, 0], d: { a: 0 } }
    assert_equal hash2, HashUtil.zero(hash1)
  end

  def test_it_merges_hash2_into_hash1
    str1 = %({
         "OccExp": [ -0.0004, 0.09600, 0.0000, -0.0204, 0.09 ,
          "abc":{"a":1,"b":0,"c":[0,1,2]} ],
          "PremRV1": [ 8.500, 4.19999981, 5.0, 7.80 ]})
    str2 = %({
          "OccExp": [ 7.00000019e-05, 0.0, -0.023, -0.0250000004, 0.0280000009,
          "abc":{"a":1.0,"b":0.0,"c":[0.0,1.0,2.0]}  ],
          "PremRV1": [ 8.5, 4.19999981, 5.5,7.80000019 ]})
    str1 = HashUtil.merge(str1, str2).gsub(/\s+/, '')
    assert_equal str2.gsub(/\s+/, ''), str1
  end

  def test_it_tokenizes_a_hash
    str2 = %(
        { "OccExp": [ 0.0250000004, 0.0199999996, "abc":{"a":1,"b":0}]}
      )
    exp_result = ['OccExp', '0.0250000004', '0.0199999996', 'abc',
                  'a', '1', 'b', '0']
    assert_equal(exp_result, HashUtil.tokenize(str2))
  end

  def test_it_extracts_all_numbers_in_a_hash
    str2 = %(
        { "OccExp": [ 0.0250000004, 0.0199999996,10e-5,
          "abc":{"a":1,"b":0,"c":[0, 1, 2]}]}
      )
    exp_result = [0.0250000004, 0.0199999996, 0.0001, 1, 0, 0, 1, 2]
    assert_equal exp_result, HashUtil.extract_numbers_hash(str2)
  end
end
