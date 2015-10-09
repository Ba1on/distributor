module SprintsHelper
  def opened_or_closed(state)
    if state
      "Opened"
    else
      "Closed"
    end
  end
end
