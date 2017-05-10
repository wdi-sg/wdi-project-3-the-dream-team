class MaterializeRenderer < MaterializePagination::Rails

  # @return [String] rendered pagination link
  def page_number(page)
    classes = ['waves-effect', ('active' if page == current_page)].join(' ')
    tag :li, link(page, page, :rel => rel_value(page)), class: classes
  end

end
