class EventUserPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def confirm?
    record.user = user
  end

  def decline?
    record.user = user
  end
end
