class PersonController < ApplicationController

  def index
    @people = Person.all

    respond_to do |f|
      f.html
      f.json {render :json => @people}
    end
  end

  def show
    @person = Person.find(params[:id])

    respond_to do |f|
      f.html
      f.json {render :json => @people}
    end
  end

  def new
    @person = Person.new

    respond_to do |f|
      f.html
    end
  end

  def create
    @person = Person.create(person_params)

    respond_to do |f|
      f.html {redirect_to action: 'index'}
    end
  end

  def destroy
    @person = Person.find(person_params)

    @person.destroy

    respond_to do |f|
      f.html {redirect_to action: 'index'}
    end
  end

  private

  def person_params
    params.require(:person).permit(:name, :age)
  end
end
