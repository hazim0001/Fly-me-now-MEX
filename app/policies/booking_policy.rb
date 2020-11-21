class BookingPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.where(renter: user).order(created_at: :desc)
    end
  end
  def index?
    user.role == "renter"
  end

  def new?
    user.role == "renter"
  end

  def create?
    new?
  end

  def edit?
    record.renter == user
  end

  def update?
    edit?
  end

  def destroy?
    edit?
  end
end
