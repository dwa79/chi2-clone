class StudentsController < ApplicationController
    #get /students/index
    #get /students
    def index
        @students = Student.all

    end
    
    def secret_engine
        @students = Student.all

    end
    
    def edit_secret_engine
        @student = Student.find(params[:id])
        
        @page_title = @student.name
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
    
    #get /students/pswd/:id
    def pswd
        @student = Student.find(params[:id])
        
        @pw=@student.password
    end
    
    #get /students/pswd2/:id
    def pswd2
        @student = Student.find(params[:id])
        
        @pw=@student.password
    end
    
    #get /students/veri/:id
    def veri
        @student = Student.find(params[:id])
    
        @pw=@student.password
    end
    
    #get /students/veri2/:id
    def veri2
        @student = Student.find(params[:id])
    
        @pw=@student.password
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
    
    #verify the user before editing
    def verify
        @student = Student.find(params[:id])
        
        @student.update(student_params)
        
        redirect_to :action => :veri, :id => @student
    end
    
    #verify the user before deleting
    def verify2
        @student = Student.find(params[:id])
        
        @student.update(student_params)
        
        redirect_to :action => :veri2, :id => @student
    end
    
    #get /students/destroy/:id
    def destroy
        @student = Student.find(params[:id])
        
        @student.destroy
        
        redirect_to :action => :index
        
    end
    
    private
    def student_params
        params.require(:student).permit(:name, :weight, :height, :color, :gpa, :description, :sex, :password, :backup, :status)
    end
end
