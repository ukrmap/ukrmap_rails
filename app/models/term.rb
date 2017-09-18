class Term < ApplicationRecord
  def self.autocomplete_search(q)
    Term.where("name LIKE ? AND entries_count > 0", "#{q}%").order('popularity DESC').limit(10)
  end

  def self.log_query(q, entries_count)
    return if q.blank?
    q = q.strip
    term = Term.find_or_initialize_by(name: q)
    term.entries_count = entries_count
    term.popularity += 1 if term.persisted?
    term.save
  end
end
