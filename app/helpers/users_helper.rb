module UsersHelper
    
    def job_title_icon
        if @user.profile.job_title == "Independent Buyer"
            "<i class='fa fa-user'></i>".html_safe
        elsif @user.profile.job_title == "Company Representative"
            "<i class='fa fa-user-plus'></i>".html_safe
        elsif @user.profile.job_title == "Store Owner"
            "<i class='fa fa-university'></i>".html_safe
        end
    end
end