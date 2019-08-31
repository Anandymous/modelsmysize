class MeasurementsController < ApplicationController
  def index
    @measurements = Measurement.page(params[:page]).per(10)

    render("measurement_templates/index.html.erb")
  end

  def show
    @measurement = Measurement.find(params.fetch("id_to_display"))

    render("measurement_templates/show.html.erb")
  end

  def new_form
    @measurement = Measurement.new

    render("measurement_templates/new_form.html.erb")
  end

  def create_row
    @measurement = Measurement.new

    @measurement.shirt_size = params.fetch("shirt_size")
    @measurement.pant_size = params.fetch("pant_size")
    @measurement.shoe_size = params.fetch("shoe_size")
    @measurement.instagram_link = params.fetch("instagram_link")
    @measurement.image_link = params.fetch("image_link")

    if @measurement.valid?
      @measurement.save

      redirect_back(:fallback_location => "/measurements", :notice => "Measurement created successfully.")
    else
      render("measurement_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @measurement = Measurement.find(params.fetch("prefill_with_id"))

    render("measurement_templates/edit_form.html.erb")
  end

  def update_row
    @measurement = Measurement.find(params.fetch("id_to_modify"))

    @measurement.shirt_size = params.fetch("shirt_size")
    @measurement.pant_size = params.fetch("pant_size")
    @measurement.shoe_size = params.fetch("shoe_size")
    @measurement.instagram_link = params.fetch("instagram_link")
    @measurement.image_link = params.fetch("image_link")

    if @measurement.valid?
      @measurement.save

      redirect_to("/measurements/#{@measurement.id}", :notice => "Measurement updated successfully.")
    else
      render("measurement_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row
    @measurement = Measurement.find(params.fetch("id_to_remove"))

    @measurement.destroy

    redirect_to("/measurements", :notice => "Measurement deleted successfully.")
  end
end
