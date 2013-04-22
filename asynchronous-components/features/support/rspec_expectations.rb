module PageHelpers
  def balance_tag
    find('span.balance')
  end
end

World(PageHelpers)
