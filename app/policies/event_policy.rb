class EventPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    true
  end

  # METHODS USED FOR THE SIMPLE_FORM:
  def create?
    true
  end
  
  def edit_what?
    update_what?
  end

  def update_what?
    user_is_host?
  end

  def edit_address?
    update_address?
  end

  def update_address?
    user_is_host?
  end

  def edit_when?
    update_when?
  end

  def update_when?
    user_is_host?
  end

  def edit_friends?
    update_friends?
  end

  def update_friends?
    user_is_host?
  end

  private

  def user_is_host?
    record.user == user
  end
end
