Spree::Admin::ReportsController.class_eval do
  before_action :add_out_of_stock_report, only: [:index]

  def add_out_of_stock_report
    Spree::Admin::ReportsController.add_available_report!(:out_of_stock_report, I18n.t("historical_stock.description_out_of_stock_report"))
  end

  def out_of_stock_report
    @out_of_stock_reports = Spree::StockEvent.where(event_name: "out_of_stock").includes(:stock_item, stock_item: [:variant], stock_item: [:stock_location]).distinct
    date_from = out_of_stock_params[:from].present? ? valid_date(out_of_stock_params[:from]) : nil
    date_to = out_of_stock_params[:to].present? ? valid_date(out_of_stock_params[:to]) : nil
    @out_of_stock_reports = @out_of_stock_reports.where("created_at >= ?", date_from) if date_from.present?
    @out_of_stock_reports = @out_of_stock_reports.where("created_at <= ?", date_to) if date_to.present?
  end

  private

  def valid_date str_date
    Date.parse(str_date) rescue nil
  end

  def out_of_stock_params
    params.permit(:from, :to, :commit)
  end
end
