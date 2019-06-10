class CreateSearchView < ActiveRecord::Migration[5.2]
  def up
    sql = <<-SQL
      CREATE VIEW searches AS
        SELECT
          s.title AS reverse_index,
          s.id AS searchable_id, 'Song' AS searchable_type,
          s.title AS label,
          s.updated_at AS updated_at
        FROM songs s

        UNION ALL

        SELECT
          a.title AS reverse_index,
          a.id AS searchable_id, 'Album' AS searchable_type,
          a.title AS label,
          a.updated_at AS updated_at
        FROM albums a
    SQL

    execute(sql)
  end

  def down
    execute('DROP VIEW searches')
  end
end