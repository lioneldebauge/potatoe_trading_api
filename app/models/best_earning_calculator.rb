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

  # O(n) = n/2 * (n + 1)
  def calculate
    best_earning = 0

    prices.each_with_index do |buying_price, i|
      prices[i..-1].each do |selling_price|
        earning =  selling_price - buying_price
        best_earning = earning if earning > best_earning
      end
    end

    best_earning
  end

  def prices
    @prices ||= Price.where(time: min_time..max_time).order(time: :asc).pluck(:value)
  end
end