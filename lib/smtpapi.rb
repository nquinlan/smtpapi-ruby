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
    return self
  end

  def add_to(email, name = nil)
    @data['to'] << (name ? name + " <" + email + ">" : email)
    return self
  end

  def set_tos(emails)
    @data['to'] = Array(emails) rescue nil
    return self
  end

  def add_substitution(from_value, to_values)
    @data['sub'][from_value] = Array(to_values) rescue nil
    return self
  end

  def set_substitutions(substitutions)
    @data['sub'] = substitutions
    return self
  end

  def add_unique_arg(key, value)
    @data['unique_args'][key] = value
    return self
  end

  def set_unique_args(args)
    @data['unique_args'] = args
    return self
  end

  def add_category(category)
    @data['category'] << category
    return self
  end

  def set_categories(categories)
    @data['category'] = categories
    return self
  end

  def add_section(from_value, to_value)
    @data['section'][from_value] = to_values
    return self
  end

  def set_section(sections)
    @data['section'] = sections
    return self
  end

  def add_filter(filter, setting, value)
    @data['filters'][filter]['settings'][setting] = value
    return self
  end

  def set_filters(filters)
    @data['filters'] = filters
    return self
  end

  def json_string
    @data.to_json
  end

end
