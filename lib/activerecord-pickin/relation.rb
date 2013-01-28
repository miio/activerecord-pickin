require 'active_record/relation'
module ActiveRecord
  module Pickin
    module Relation
      def pickin into_class, columns = {}
        insert_arel = Arel::InsertManager.new(arel.engine)
        insert_arel.into into_class.table_name
        if columns.empty?
          insert_arel.ast.columns = into_class.map { |c| Arel::Attributes::Attribute.new insert_arel, c.name }
        else
          insert_arel.ast.columns = columns.keys.map { |c| Arel::Attributes::Attribute.new insert_arel, c }
        end
        columns.map { |c| c.to_s }
        select_arel = self.select(columns.values)
        @klass.connection.execute "#{insert_arel.to_sql} #{select_arel.to_sql}"
      end
    end
  end
end
