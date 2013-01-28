require "activerecord-pickin/version"
require "activerecord-pickin/relation"
require 'active_record'
require 'active_support'
require 'active_support/core_ext/hash'
module Activerecord
  module Pickin
    if defined?( ::Rails )
      class Railtie < ::Rails::Railtie
        def self.apply_activerecord_patch
          ActiveSupport.on_load(:active_record) do
            ActiveRecord::Relation.send(:include, ActiveRecord::Pickin::Relation)
          end
        end

        config.after_initialize do
          self.apply_activerecord_patch
        end
      end
    end
  end
end
