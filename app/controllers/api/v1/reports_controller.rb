module Api
  module V1
    class ReportsController < Api::BaseController
      respond_to :json
      before_filter :authenticate_admin!

      def create
        respond_with current_admin.reports.create(params[:report])  
      end

      def update_status
        @report = Report.find(params[:report_id])
        @report.update_attribute :status, params[:status]
        respond_with @report
      end
    end
  end
end
