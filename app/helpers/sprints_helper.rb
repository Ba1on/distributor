module SprintsHelper
  def sprint_state(state)
    case state
    when 1
      t(:opened)
    when 0
      t(:closed)
    when 2
      t(:in_work)
    else
      t(:something_went_wrong)
    end
  end
end
