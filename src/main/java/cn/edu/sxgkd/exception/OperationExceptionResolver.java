package cn.edu.sxgkd.exception;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerExceptionResolver;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.SQLException;

@Component
public class OperationExceptionResolver implements HandlerExceptionResolver {
    @Override
    public ModelAndView resolveException(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, Exception e) {
        OperationException operationException = null;
        if (e instanceof OperationException) {
            operationException = (OperationException) e;
        } else if (e instanceof NullPointerException) {
            operationException = new OperationException("空指针异常");
        } else if (e instanceof ArithmeticException) {
            operationException = new OperationException("算术异常");
        } else {
            operationException = new OperationException("未知异常");
        }

        //错误信息
        String errorMessage = operationException.getMessage();

        //返回错误页面
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("errorMessage", errorMessage);
        modelAndView.setViewName("error");
        return modelAndView;
    }
}
