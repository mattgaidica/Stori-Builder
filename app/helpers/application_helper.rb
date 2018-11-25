module ApplicationHelper
  def shift_hsv(startHue,nColors,ii)
    ((360 * (ii - 1)/nColors) + startHue) % 360
  end
end
