class StudentsController < ApplicationController
    #get /students/index
    #get /students
    def index
        @students = Student.all

    end
    
    #get /students/show/:id
    def show
        @student = Student.find(params[:id])

        
        @page_title = @student.name
    end
    
    #get /students/edit/:id
    def edit
        @student = Student.find(params[:id])
        
        @page_title = @student.name
    end
    #get /students/new
    def new
        @student = Student.new
    end
    
    #post /students/create
    def create
        @student = Student.new( student_params)
        
        @student.save
        
        redirect_to :action => :index  #tell browser http code: 3003
    end
    
    #post students/update/:id
    def update
        @student = Student.find(params[:id])
        
        @student.update(student_params)
        
        redirect_to :action => :show, :id => @student
    end
    
    #get /students/destroy/:id
    def destroy
        @student = Student.find(params[:id])
        
        @student.destroy
        
        redirect_to :action => :index
        
    end
    
    private
    def student_params
        params.require(:student).permit(:name, :weight, :height, :color, :gpa, :description, :sex)
    end
end
