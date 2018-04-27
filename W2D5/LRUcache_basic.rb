class LRUCache
  attr_accessor :cache_size, :cache_array
    def initialize(cache_size)
      @cache_array = Array.new
      @cache_size = cache_size
    end

    def count
      # returns number of elements currently in cache
      @cache_array.length
    end

    def add(el)
      # adds element to cache according to LRU principle
      if self.count < @cache_size
        if @cache_array.include?(el)
          @cache_array.delete(el)
          @cache_array << el
        else
          @cache_array << el
        end
      else
        if @cache_array.include?(el)
          @cache_array.delete(el)
          @cache_array << el
        else
          @cache_array.shift
          @cache_array << el
        end
      end
    end

    def show
      # shows the items in the cache, with the LRU item first
      @cache_array
    end

    private
    # helper methods go here!

  end
