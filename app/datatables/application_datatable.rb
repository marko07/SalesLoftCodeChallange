class ApplicationDatatable
  delegate :params, to: :@view
  def initialize(view)
    @view = view
  end

  def as_json(options = {})
    {
      recordsTotal: 310,
      recordsFiltered: 310,
      data: data
    }
  end

  private

  def page
    params[:start].to_i / per_page + 1
  end

  def per_page
    25
  end
end
