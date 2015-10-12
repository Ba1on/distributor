module SprintsHelper
  def opened_or_closed(state)
    if state
      t(:opened)
    else
      t(:closed)
    end
  end
end
