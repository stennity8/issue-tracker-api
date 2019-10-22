class IssuesController < ApplicationController
  def index
    issues = Issue.all

    render json: issues
  end

  def issue_comments
    issue = Issue.find_by(id: params[:issue_id])
    comments = issue.comments

    render json: comments
  end

  private 

  def issue_params
    params.require(:issue).permit(:title, :description, :creator, :open_status, :resolved_date)
  end
end
