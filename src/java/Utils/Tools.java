package Utils;

import java.security.MessageDigest;
import javax.servlet.http.HttpServletRequest;

public class Tools {

    public static java.sql.Timestamp getCurrentTimeStamp() {
        java.util.Date hoy = new java.util.Date();
        return new java.sql.Timestamp(hoy.getTime());

    }

    public static String getClientIpAddr(HttpServletRequest request) {
        String ip = request.getHeader("X-Forwarded-For");
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getHeader("Proxy-Client-IP");
        }

        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getHeader("WL-Proxy-Client-IP");
        }

        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getHeader("HTTP_CLIENT_IP");
        }

        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getHeader("HTTP_X_FORWARDED_FOR");
        }

        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getRemoteAddr();
        }

        return ip;
    }

    // We need a bytesToHex method first. So, from -
// http://stackoverflow.com/a/9855338/2970947
    final protected static char[] hexArray = "0123456789ABCDEF"
            .toCharArray();

    public static String bytesToHex(byte[] bytes) {
        char[] hexChars = new char[bytes.length * 2];
        int v;
        for (int j = 0; j < bytes.length; j++) {
            v = bytes[j] & 0xFF;
            hexChars[j * 2] = hexArray[v >>> 4];
            hexChars[j * 2 + 1] = hexArray[v & 0x0F];
        }
        return new String(hexChars);
    }

// Change this to something else.
    private static String SALT = "Gpo3SISCOOB";

// A password hashing method.
    public static String hashPassword(String in) {
        try {
            MessageDigest md = MessageDigest
                    .getInstance("SHA-256");
            md.update(SALT.getBytes());        // <-- Prepend SALT.
            md.update(in.getBytes());
            // md.update(SALT.getBytes());     // <-- Or, append SALT.

            byte[] out = md.digest();
            return bytesToHex(out);            // <-- Return the Hex Hash.
        } catch (Exception e) {
            System.out.println("Error en hashPassword(): " + e);
            e.printStackTrace();
        }
        return "";
    }

}
