class BestEarningCalculator
  attr_reader :min_time, :max_time

  def initialize(min_time:, max_time:)
    @min_time = min_time
    @max_time = max_time
  end

  def result
    return 0 if prices.count < 2

    calculate
  end

  private

  # Best case scenario : O(1)
  # Worst case scenario : O(n*n)
  # It works but it is not ideal
  def calculate
    prices.each do |price|
      min_price = prices.reverse.find do|other_price|
        next if other_price == price

        price.time > other_price.time
      end

      break price.value - min_price.value if min_price
    end
  end

  def prices
    @prices ||= Price.where(time: min_time..max_time).order(value: :desc)
  end
end