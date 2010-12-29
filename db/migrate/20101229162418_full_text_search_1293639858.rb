class FullTextSearch1293639858 < ActiveRecord::Migration
  def self.up
    execute(<<-'eosql'.strip)
      DROP index IF EXISTS items_fts_idx
    eosql
    execute(<<-'eosql'.strip)
      CREATE index items_fts_idx
      ON items
      USING gin((to_tsvector('english', coalesce("items"."name", '') || ' ' || coalesce("items"."description", ''))))
    eosql
  end

  def self.down
    execute(<<-'eosql'.strip)
      DROP index IF EXISTS items_fts_idx
    eosql
  end
end
