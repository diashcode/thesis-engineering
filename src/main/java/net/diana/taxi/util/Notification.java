package net.diana.taxi.util;

public class Notification
{
    public static final String PRIMARY = "PRIMARY";
    public static final String WARNING = "WARNING";
    public static final String SUCCESS = "SUCCESS";
    public static final String DANGER = "DANGER";

    private String type;
    private String message;

    public Notification()
    {

    }

    public Notification(String type, String message)
    {
        this.type = type;
        this.message = message;
    }

    public String getType() { return type; }
    public void setType() { this.type = type; }

    public String getMessage() { return message; }
    public void setMessage() { this.message = message; }
}