class StaticsController < ApplicationController
    
    def home
        @lessons = Lesson.all
        
    end

    def calendar
        @lessons = Lesson.all
    end
end