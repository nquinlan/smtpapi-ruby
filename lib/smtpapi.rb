require 'json'

class Header

  def initialize
    @data = {
        "to"          => [],
        "sub"         => {},
        "unique_args" => {},
        "category"    => [],
        "section"     => {},
        "filters"     => {},
    }
  end

  def add_to(email, name = nil)
    @data['to'] << (name ? name + " <" + email + ">" : email)
  end

  def set_tos(emails)
    @data['to'] = Array(emails) rescue nil
  end

  def add_substitution(from_value, to_values)
    @data['sub'][from_value] = Array(to_values) rescue nil
  end

  def set_substitutions(substitutions)
    @data['sub'] = substitutions
  end

  def add_unique_arg(key, value)
    @data['unique_args'][key] = value
  end

  def set_unique_args(args)
    @data['unique_args'] = args
  end

  def add_category(category)
    @data['category'] << category
  end

  def set_categories(categories)
    @data['category'] = categories
  end

  def add_section(from_value, to_value)
    @data['section'][from_value] = to_values
  end

  def set_section(sections)
    @data['section'] = sections
  end

  def add_filter(filter, setting, value)
    @data['filters'][filter]['settings'][setting] = value
  end

  def set_filters(filters)
    @data['filters'] = filters
  end

  def json_string
    @data.to_json
  end

end
