class AddFulltextSearchIndexOnEntries < ActiveRecord::Migration[5.0]
=begin
  def up
    return if ENV['TRAVIS'] == 'true'
    execute <<-SQL.strip_heredoc
      ALTER TABLE `entries`
      ADD FULLTEXT INDEX `fulltext_multilang_index_entries_on_title_and_content`
      (`title_uk`, `content_uk`, `title_ru`, `content_ru`, `title_en`, `content_en`, `title_be`, `content_be`);
    SQL
  end

  def down
    execute "DROP INDEX `fulltext_multilang_index_entries_on_title_and_content` ON `entries`"
  end
=end
end
