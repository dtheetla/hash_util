require "test_helper"

class HashUtilTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::HashUtil::VERSION
  end

  def test_it_adds_hash2_to_hash1
    hash1 = {a:1,b:2,c:[1,2],d:{a:1}}
    hash2 = {a:3,b:3,c:[3,2],d:{a:10}}
    hash3 = {a:4,b:5,c:[4,4],d:{a:11}}
    assert_equal hash3, HashUtil.add_hash2_to_hash1(hash1,hash2)
  end

  def test_it_sets_zeros_in_the_hash
    hash1 = {a:1,b:2,c:[1,2],d:{a:1}}
    hash2 = {a:0,b:0,c:[0,0],d:{a:0}}
    assert_equal hash2, HashUtil.zero(hash1)
  end


end
