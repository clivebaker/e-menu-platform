class Ability
  include CanCan::Ability

  def initialize(user)


    # binding.pry

       user ||= RestaurantUser.new # guest user (not logged in)



        if user.role? :admin
          can :manage, :all
         # can :manage, :admin_dropdown
        end

  end


    def self.roles

        [:admin]

    end

end
