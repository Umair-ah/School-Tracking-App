class StaticsController < ApplicationController
    
    def home
        @lessons = Lesson.all
        
    end

    def calendar
        if params[:user_id].present?
          @lessons = Lesson.includes(:user, :classroom, :course, :attendances).where(user_id: params[:user_id])
        else
          @lessons = Lesson.includes(:user, :classroom, :course, :attendances)
        end
    end
    
end