class AirplanePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    true
  end

  def new?
    user.role == "owner"
  end

  def create?
    new?
  end

  def edit?
    if user.role == "owner"
      if record.class != Class
        record.owner == user
      else
        record.find_by(owner: user).owner == user
      end
    else
      false
    end
  end

  def update?
    edit?
  end

  def destroy?
    edit?
  end
end
