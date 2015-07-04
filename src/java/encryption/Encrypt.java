package encryption;

import java.security.Key;
import javax.crypto.Cipher;
import javax.crypto.spec.SecretKeySpec;
import javax.xml.bind.DatatypeConverter;

public class Encrypt {

    private static final String ALGO = "AES";
    private static final String KEY = "IAmUzumakiNaruto";
    private static final byte[] KEYVALUE = KEY.getBytes();

    public static void main(String[] args) {
        try {
            String msg = "sharma";
            String enc = encrypt(msg);
            String dec = decrypt(enc);
            System.out.println(enc);
            System.out.println(dec);
        } catch (Exception ex) {
            System.err.println(ex.getMessage());
        }
    }

    public static String encrypt(String Data) throws Exception {
        Key key = generateKey();
        Cipher c = Cipher.getInstance(ALGO);
        c.init(Cipher.ENCRYPT_MODE, key);
        byte[] encVal = c.doFinal(Data.getBytes());
        String encryptedValue = DatatypeConverter.printBase64Binary(encVal);
        return encryptedValue;
    }

    public static String decrypt(String encryptedData) throws Exception {
        Key key = generateKey();
        Cipher c = Cipher.getInstance(ALGO);
        c.init(Cipher.DECRYPT_MODE, key);
        byte[] decordedValue = DatatypeConverter.parseBase64Binary(encryptedData);
        byte[] decValue = c.doFinal(decordedValue);
        String decryptedValue = new String(decValue);
        return decryptedValue;
    }

    private static Key generateKey() throws Exception {
        Key key = new SecretKeySpec(KEYVALUE, ALGO);
        return key;
    }

}
