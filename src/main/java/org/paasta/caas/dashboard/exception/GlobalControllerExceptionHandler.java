package org.paasta.caas.dashboard.exception;

import org.codehaus.jettison.json.JSONException;
import org.codehaus.jettison.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.HttpClientErrorException;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Locale;

/**
 * org.openpaas.paasta.portal.api.exception
 *
 * @author 김도준
 * @version 1.0
 * @since 2016.07.07
 */
//@ControllerAdvice
public class GlobalControllerExceptionHandler {

    private static final Logger LOGGER = LoggerFactory.getLogger(GlobalControllerExceptionHandler.class);

    @Autowired
    public MessageSource messageSource;


    @ExceptionHandler({HttpClientErrorException.class})
    @ResponseBody
    public boolean handleHttpClientErrorException(HttpClientErrorException e, HttpServletResponse response) throws Exception {
        response.sendError(e.getStatusCode().value(), getExceptionMessage(e));
        return false;
    }


    @ExceptionHandler({Exception.class})
//    @ResponseBody
    public ModelAndView handleAnyException(Exception e, HttpStatus status, HttpServletResponse response) throws IOException {
        System.out.println(status.value());
        return new ModelAndView("/common/error/401");
    }
//    public boolean handleAnyException(Exception e, HttpServletResponse response) throws IOException {
//        return errorResponse(e, HttpStatus.INTERNAL_SERVER_ERROR, response);
//    }


    //common message
    private boolean errorResponse(Throwable throwable, HttpStatus status, HttpServletResponse response) throws IOException {

        LOGGER.error("### Exception :" + throwable.getMessage());

        response.sendError(status.value(), messageSource.getMessage(status.toString(), null, Locale.KOREA));

        return false;
    }


    public String getExceptionMessage(HttpClientErrorException ex) throws JSONException {

        JSONObject jsonObj = new JSONObject(ex.getResponseBodyAsString());
        String message;
        LOGGER.info("Exception messageSource : " + messageSource);
        try {
            message = jsonObj.getString("message");
            LOGGER.info("Exception Message : " + message);
        } catch (Exception e) {
            message = "실행 도중 오류가 발생했습니다!";
        }
        return message;
    }


}
