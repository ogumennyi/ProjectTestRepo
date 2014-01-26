package utils;

import java.util.Map;

import org.springframework.validation.Errors;
import org.springframework.validation.Validator;
import org.springframework.web.context.request.WebRequest;

import com.moysport.model.User;

public class UserValidator implements Validator {
	private WebRequest webRequest;
	
	public UserValidator(WebRequest webRequest) {
        this.webRequest = webRequest;
    }

	
	@Override
    public boolean supports(Class<?> clazz) {
      return User.class.equals(clazz);
    }

    @Override
    public void validate(Object target, Errors errors) {
      //User user = (User) target;
      Map<String, String[]> parameterMap = webRequest.getParameterMap();
      String textMonth = parameterMap.get("month")[0];
      String day = parameterMap.get("day")[0]; 
      int daysInMonth = getDaysInMonthCount(textMonth);
      
      if(Integer.parseInt(day) > daysInMonth) {
    	  errors.rejectValue("birthdate","wrong_date", "There are " + daysInMonth + "days in " + textMonth);
      }

      // do "complex" validation here

    }
    
    public int getDaysInMonthCount(String textMonth) {
    	int daysInMonth = 0;    	
    	if("Январь".equals(textMonth)) {
    		daysInMonth = 31;
    	}
    	else if("Февраль".equals(textMonth)) {
    		daysInMonth = 29;
    	}
    	else if("Март".equals(textMonth)) {
    		daysInMonth = 31;
    	}
    	else if("Апрель".equals(textMonth)) {
    		daysInMonth = 30;
    	}
    	else if("Май".equals(textMonth)) {
    		daysInMonth = 31;
    	}
    	else if("Июнь".equals(textMonth)) {
    		daysInMonth = 30;
    	}
    	else if("Июль".equals(textMonth)) {
    		daysInMonth = 31;
    	}
    	else if("Август".equals(textMonth)) {
    		daysInMonth = 31;
    	}
    	else if("Сентябрь".equals(textMonth)) {
    		daysInMonth = 30;
    	}
    	else if("Октябрь".equals(textMonth)) {
    		daysInMonth = 31;
    	}
    	else if("Ноябрь".equals(textMonth)) {
    		daysInMonth = 30;
    	}
    	else if("Декабрь".equals(textMonth)) {
    		daysInMonth = 31;
    	} 	
    	return daysInMonth;
    }

}
