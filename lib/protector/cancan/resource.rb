module Protector
  module CanCan
    module Resource extend ActiveSupport::Concern

      def resource_base
        resource = super

        if resource_protectable? resource
          resource.restrict!(current_ability.protector_subject)
        else
          resource
        end
      end

      def load_collection
        resource = resource_base

        if resource_protectable? resource
          resource
        else
          super
        end
      end

      def load_collection?
        if resource_protectable? resource_base
          true
        else
          super
        end
      end

      private

      def resource_protectable?(resource)
        resource.respond_to?(:restrict!) &&
        current_ability.protector_subject?
      end
    end
  end
end