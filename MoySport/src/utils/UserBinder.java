package utils;

import java.beans.PropertyEditorSupport;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;

import org.springframework.web.context.request.WebRequest;

public class UserBinder extends PropertyEditorSupport {
    private WebRequest webRequest;

    public UserBinder(WebRequest webRequest) {
        this.webRequest = webRequest;
    }

    @Override
    public void setAsText(String text) throws IllegalArgumentException {
        Map<String, String[]> parameterMap = webRequest.getParameterMap();
        String year = parameterMap.get("year")[0];
        String textMonth = parameterMap.get("month")[0];
        String day = parameterMap.get("day")[0];        
        String numericMonth = getMonthData(textMonth);
        String formatDay = getFormatNumber(day);       
        try {
            String textDate = year + numericMonth + formatDay;
			Date parsedDate = new SimpleDateFormat("yyyyMMdd").parse(textDate);
			Timestamp date = new Timestamp(parsedDate.getTime());
			setValue(date);
			
        } catch (ParseException ex) {
            setValue(null);
        }
    }
    
    public String getMonthData(String textMonth) {
    	String numericMonth = "";     	
    	if("Январь".equals(textMonth)) {
    		numericMonth = "01";
    	}
    	else if("Февраль".equals(textMonth)) {
    		numericMonth = "02";
    	}
    	else if("Март".equals(textMonth)) {
    		numericMonth = "03";
    	}
    	else if("Апрель".equals(textMonth)) {
    		numericMonth = "04";
    	}
    	else if("Май".equals(textMonth)) {
    		numericMonth = "05";
    	}
    	else if("Июнь".equals(textMonth)) {
    		numericMonth = "06";
    	}
    	else if("Июль".equals(textMonth)) {
    		numericMonth = "07";
    	}
    	else if("Август".equals(textMonth)) {
    		numericMonth = "08";
    	}
    	else if("Сентябрь".equals(textMonth)) {
    		numericMonth = "09";
    	}
    	else if("Октябрь".equals(textMonth)) {
    		numericMonth = "10";
    	}
    	else if("Ноябрь".equals(textMonth)) {
    		numericMonth = "11";
    	}
    	else if("Декабрь".equals(textMonth)) {
    		numericMonth = "12";
    	}
   	
    	return numericMonth;
    }
    
    public String getFormatNumber(String textNumber) {
    	String formatNumber = "";
    	if(textNumber.length() > 1) {
    		formatNumber = "0" + textNumber;
    	}
    	else {
    		formatNumber = textNumber;
    	}
    	return formatNumber;
    }
    
    
}