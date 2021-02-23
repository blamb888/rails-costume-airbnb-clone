class CostumePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def new?
    #have to be logged in
    true
  end

  def create?
    #have to be logged in
    true
  end

  def update?
    true
  end
end
