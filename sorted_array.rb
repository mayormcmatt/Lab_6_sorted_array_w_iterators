class SortedArray
  attr_reader :internal_arr

  def initialize arr=[]
    @internal_arr = []
    arr.each { |el| add el }
  end

  def add el
    # we are going to keep this array
    # sorted at all times. so this is ez
    lo = 0
    hi = @internal_arr.size
    # note that when the array just
    # starts out, it's zero size, so
    # we don't do anything in the while
    # otherwise this loop determines
    # the position in the array, *before*
    # which to insert our element
    while lo < hi
      # let's get the midpoint
      mid = (lo + hi) / 2
      if @internal_arr[mid] < el
        # if the middle element is less 
        # than the current element
        # let's increment the lo by one
        # from the current midway point
        lo = mid + 1
      else
        # otherwise the hi *is* the midway 
        # point, we'll take the left side next
        hi = mid 
      end
    end

    # insert at the lo position
    @internal_arr.insert(lo, el)
  end

  def each &block
    #loop over all elements in @internal_arr
    #yield to each element

    i = 0 #keep track of index
    while i < @internal_arr.size
      yield @internal_arr[i]
      i += 1
      return @internal_arr
    end
    # raise NotImplementedError.new("You need to implement the each method!")
  end

  def map &block
    #map takes in one array, iterates through it using a block
    #and returns a new array based on results of that block code
    new_arr = [] #new empty array, because .map returns new array
    i = 0 #iterator set to 0, beginning
    until i == @internal_arr.size
      temp = yield @internal_arr[i]
      new_arr << temp
      i += 1
    end
    new_arr
    # raise NotImplementedError.new("You need to implement the map method!")
  end

  def map! &block
    i = 0
    while i < @internal_arr.size
      temp = yield @internal_arr[i]
      i += 1
    end
    @internal_arr << temp
    # raise NotImplementedError.new("You need to implement the map! method!")
  end

  def find &block
    raise NotImplementedError.new("You need to implement the find method!")
  end

  def inject acc=nil, &block
    raise NotImplementedError.new("You need to implement the inject method!")
  end
end
