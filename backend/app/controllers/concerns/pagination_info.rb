module PaginationInfo
  def get_page_details(objects)
    {
      total_pages: objects.total_pages,
      total_objects: objects.total_count,
      current_page: objects.current_page,
      prev_page: objects.prev_page,
      next_page: objects.next_page
    }
  end
end
