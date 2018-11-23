module ApplicationHelper
  def shift_hsv(start,n,ii)
    ((360 * (ii - 1)/n) + start) % 360
  end
end
