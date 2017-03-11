module EntriesHelper
  def category(key)
    Entry.find_by(category: key).title
  end

  def entry_path(entry, opts = {})
    case entry.level
      when 1 then category_path({category: entry.category}.merge(opts))
      when 2 then course_path({course: entry.course}.merge(opts))
      when 3 then show_entry_path({course: entry.course, id: entry.id}.merge(opts))
    end
  end
end
