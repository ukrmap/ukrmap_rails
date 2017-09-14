class Term < ApplicationRecord
  def self.log_query(q, entries_count)
    return [] if q.blank?
    q = q.strip
    term = Term.find_or_initialize_by(name: q)
    term.entries_count = entries_count
    term.popularity += 1  if term.persisted?
    term.save
  end
end
