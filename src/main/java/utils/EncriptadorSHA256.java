package utils;

import java.security.NoSuchAlgorithmException;
import java.security.MessageDigest;

public class EncriptadorSHA256
{
    public static String convertirSHA256(final String password) {
        MessageDigest md = null;
        try {
            md = MessageDigest.getInstance("SHA-256");
        }
        catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
            return null;
        }
        final byte[] hash = md.digest(password.getBytes());
        final StringBuffer sb = new StringBuffer();
        byte[] array;
        for (int length = (array = hash).length, i = 0; i < length; ++i) {
            final byte b = array[i];
            sb.append(String.format("%02x", b));
        }
        return sb.toString();
    }
}