class Hash
  def pluck(keys)
    key_list = (keys.is_a? Array) ? keys : [:keys]
    ret = {}
    each { |k,v| ret[k] = v if key_list.include?(k) }
    ret
  end
end