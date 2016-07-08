class Bike

  def broken
    @broken = true
  end

  def broken?
    @broken
  end

  def working?
    !@broken
  end
end
