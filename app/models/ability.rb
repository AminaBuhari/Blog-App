class Ability
  include CanCan::Ability

  def initialize( user )

      user ||= User.new
      can :read, :all
  
      if user.is? :admin
        can :manage, :all
      else
        can :manage, Comment, author_id: user.id
        can :manage, Post, author_id: user.id
        can :read, :all
      end
  end

end
