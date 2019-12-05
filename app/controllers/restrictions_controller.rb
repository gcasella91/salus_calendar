class RestrictionsController < ApplicationController
  def index
    @restrictions = Restriction.all

    render("restriction_templates/index.html.erb")
  end

  def show
    @restriction = Restriction.find(params.fetch("id_to_display"))

    render("restriction_templates/show.html.erb")
  end

  def new_form
    @restriction = Restriction.new

    render("restriction_templates/new_form.html.erb")
  end

  def create_row
    @restriction = Restriction.new

    @restriction.user_id = params.fetch("user_id")

    if @restriction.valid?
      @restriction.save

      redirect_back(:fallback_location => "/restrictions", :notice => "Restriction created successfully.")
    else
      render("restriction_templates/new_form_with_errors.html.erb")
    end
  end

  def create_row_from_user
    @restriction = Restriction.new

    @restriction.user_id = params.fetch("user_id")

    if @restriction.valid?
      @restriction.save

      redirect_to("/users/#{@restriction.user_id}", notice: "Restriction created successfully.")
    else
      render("restriction_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @restriction = Restriction.find(params.fetch("prefill_with_id"))

    render("restriction_templates/edit_form.html.erb")
  end

  def update_row
    @restriction = Restriction.find(params.fetch("id_to_modify"))

    @restriction.user_id = params.fetch("user_id")

    if @restriction.valid?
      @restriction.save

      redirect_to("/restrictions/#{@restriction.id}", :notice => "Restriction updated successfully.")
    else
      render("restriction_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row_from_user
    @restriction = Restriction.find(params.fetch("id_to_remove"))

    @restriction.destroy

    redirect_to("/users/#{@restriction.user_id}", notice: "Restriction deleted successfully.")
  end

  def destroy_row
    @restriction = Restriction.find(params.fetch("id_to_remove"))

    @restriction.destroy

    redirect_to("/restrictions", :notice => "Restriction deleted successfully.")
  end
end
