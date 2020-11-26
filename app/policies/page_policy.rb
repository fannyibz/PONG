class PagePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
      # scope.joins(:event_users).where(event_users: { user: u }).or(scope.joins(:event_users).where(user: u))
    end
  end

  def home?
    record.user == user
  end

  def components?
    true
  end

  def dashboard?
    true
  end

end
