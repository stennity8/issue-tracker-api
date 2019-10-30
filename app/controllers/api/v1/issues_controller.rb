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
    issue.resolved_date = Time.now
    issue.save
    
    render json: issue
  end

  private 

  def issue_params
    params.require(:issue).permit(:title, :description, :creator, :open_status, :resolved_date, :id)
  end
end
