module Jekyll::CustomFilter
  include Jekyll::Filters::URLFilters

  def nyx_absolute_url(input)
    return if input.nil?

    puts input

    env = ENV['JEKYLL_ENV'] || 'development'

    input_ = absolute_url(input)

    if(env == 'development')
      input_ = input_.sub("0.0.0.0", "nyx.local")
    end

    return input_
  end

end


Liquid::Template.register_filter(Jekyll::CustomFilter)
