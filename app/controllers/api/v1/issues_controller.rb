class Api::V1::IssuesController < ApplicationController
  def index
    issues = Issue.all

    render json: issues
  end

  def open_issues
    issues = Issue.unresolved

    render json: issues
  end

  def closed_issues
    issues = Issue.resolved

    render json: issues
  end

  def show
    issue = Issue.find(params[:id])

    render json: issue
  end

  def issue_comments
    issue = Issue.find_by(id: params[:issue_id])
    comments = issue.comments

    render json: comments
  end

  def create
    issue = Issue.create(issue_params)

    render json: issue
  end

  def update
    issue = Issue.find(params[:id])
    issue.update(issue_params)
    issue.save
    
    render json: issue
  end

  def destroy
    issue = Issue.find(params[:id])
    # Delete comments before deleting issue
    issue.comments.each{|comment| comment.destroy}
    issue.destroy

    render json: issue
  end

  private 

  def issue_params
    params.require(:issue).permit(:title, :description, :creator, :open_status, :resolved_date, :id)
  end
end
