class BookingPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def new?
    #have to be logged in
  end

  def create?
    #have to be logged in
    false
  end

  def update?
    false
  end
end
