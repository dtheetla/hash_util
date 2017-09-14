require "hash_util/version"

module HashUtil
  # adds up hash2 values in to hash1
  def self.add_hash2_to_hash1(a1,b1)
    if a1.class.name=="Array"
      a1= a1.enum_for(:each_with_index).collect{|m,index|
        if(['Array','Hash'].include?(m.class.name))
           add_hash2_to_hash1(a1[index],b1[index])
         else
          m + b1[index]
        end
      }
      return a1
    elsif a1.class.name=="Hash"
      a1.each do |k,v|
        if ['Array','Hash'].include?(a1[k].class.name)
          a1[k]=add_hash2_to_hash1(a1[k],b1[k])
        else
          a1[k] += b1[k]
        end
      end
    else
      a1[k]+=b1[k]
    end
  end

  #  set all values in the hash to 0
  def self.zero(obj)
    if obj.class.name=="Array"
      obj=obj.collect{|m|
        ['Array','Hash'].include?(m.class.name) ? zero(m) : 0
      }
    elsif obj.class.name=="Hash"
      obj.each do |k,v|
        if ['Array','Hash'].include?(obj[k].class.name)
          obj[k]=zero(obj[k])
        else
          obj[k]=0
        end
      end
    else
      obj[k]=0
    end
 end

end
