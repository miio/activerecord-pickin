require 'active_record/relation'
module ActiveRecord
  module Pickin
    module Relation
      def pickin into_class, override = {}, ignore = []
        insert_arel = Arel::InsertManager.new(arel.engine)
        insert_arel.into into_class.table_name

        if self.select_values.empty?
          columns = into_class.columns
        else
          columns = self.select_values
        end

        insert_arel.ast.columns = columns.map do |c|
          unless c.class == Symbol
            c = c.name
          end
          Arel::Attributes::Attribute.new(insert_arel, c)
        end
        insert_sql = insert_arel.to_sql

        # Remove insert quote for only mysql adapters
        if ['MySql', 'Mysql2'].include? @klass.connection.adapter_name
          insert_sql = insert_arel.to_sql.delete!('`').gsub!('\'', '`')
        end

        select_column = self.get_select_column columns, override, ignore
        self.select_values = []
        select_arel = self.select(select_column)

        @klass.connection.execute "#{insert_sql} #{select_arel.to_sql}"
      end

      def get_select_column target, override, ignore
        target.map do |c|
          unless c.class == Symbol
            c = c.name.to_sym
          end
          convert_element(c, override) unless ignore.include? c
        end
      end

      def convert_element column, override
        if override.keys.include?(column)
          if override[column].class == Symbol
            @klass.connection.quote_column_name override[column]
          else
            "'#{override[column]}'"
          end
        else
          @klass.connection.quote_column_name column.to_s
        end
      end

    end
  end
end
