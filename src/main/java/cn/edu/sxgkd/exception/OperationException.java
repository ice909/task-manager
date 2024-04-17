package cn.edu.sxgkd.exception;

import org.springframework.validation.ObjectError;

import java.util.List;

public class OperationException extends RuntimeException{
    private String message;

    public OperationException(String message) {
        super(message);
        this.message = message;
    }

    public OperationException(List<ObjectError> errors){
        super(errors.toString());
        StringBuilder message = new StringBuilder();
        for(ObjectError error : errors){
            message.append(error.getDefaultMessage()).append(";");
        }
        this.message = message.toString();
    }

    @Override
    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }
}
