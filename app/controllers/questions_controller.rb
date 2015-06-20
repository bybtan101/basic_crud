class QuestionsController < ApplicationController

def new
  #defining on new question instance variable to help us generate the 
  #form needed to create the question
  @question = Question.new
  #THis will render app/views/questions/new.html.erb (by convention)
  end

def create
    #This uses strong parameters feature of Rails where you must explicit by 
    #default about what parameters you'd like to allow for your record
    #in this case we only want the user to enter the title and the body
    question_params = params.require(:question).permit([:title, :body])
    @question       = Question.new(question_params)
    
    if @question.save
      #redirect_to sends a response back to the browser with a new URL so the
      #browser can understand.
      redirect_to question_path(@question)
    else
      #this will render new.html.erb inside of "/views/questions/" folder
      render :new 
    end
    #this is just to show on the page the params we get from the user
    #for testing purposes
    end

  def show
    #you acccess this action by visiting /questions/:id 
    #where :id is the id of the question we'd like to display
    @question = Question.find params[:id]
  end
  
def index
    @questions = Question.all
  end




end