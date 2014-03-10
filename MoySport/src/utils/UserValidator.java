package utils;

import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;
import org.springframework.web.context.request.WebRequest;

import com.moysport.model.User;
import com.moysport.service.UserService;

public class UserValidator implements Validator {
	private WebRequest webRequest;
	private UserService userService;
	public UserValidator(WebRequest webRequest, UserService userService) {
        this.webRequest = webRequest;
        this.userService = userService;
        
    }

	
	@Override
    public boolean supports(Class<?> clazz) {
      return User.class.equals(clazz);
    }

    @Override
    public void validate(Object target, Errors errors) {
      User user = (User) target;
      boolean isWrongDate = false;
      boolean isWrongEmail = false;
      boolean isNotUniqueNickname = false;
      boolean isWrongPassword = false;
      //Validate birthdate
      Map<String, String[]> parameterMap = webRequest.getParameterMap();
      String textMonth = parameterMap.get("month")[0];
      String day = parameterMap.get("day")[0]; 
      int daysInMonth = getDaysInMonthCount(textMonth);
      isWrongDate = Integer.parseInt(day) > daysInMonth;
      //Validate email
      isWrongEmail = user.getEmail().indexOf("@") == -1;
      //Validate Nickname
      String nickname = user.getNickname();
      List<User> listUsers = userService.listUser();
      Iterator<User> usersIterator = listUsers.iterator();
      System.out.println("Current user: " + nickname);
      while (usersIterator.hasNext()) {
    	  User searchUser = usersIterator.next();
    	  System.out.println("Search user: " + searchUser.getNickname());
    	  if(nickname.equals(searchUser.getNickname())){
    		  System.out.println("Not unique user");
    		  isNotUniqueNickname = true;  
    		  break;
    	  }
      }
      //Validate password
      String password = user.getPassword();
      String confirmPassword = parameterMap.get("confirm_password")[0]; 
      if(!password.equals(confirmPassword)){
    	  isWrongPassword = true; 
      } 
      
      if(isWrongDate) {
    	  errors.rejectValue("birthdate","label.registration.wrong_date");
      }
      if(isWrongEmail) {
    	  errors.rejectValue("email","label.registration.wrong_email");
      }
      if(isNotUniqueNickname) {
    	  errors.rejectValue("nickname","label.registration.wrong_nickname");
      }
      if(isWrongPassword) {
    	  errors.rejectValue("pwd","label.registration.wrong_password");
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
