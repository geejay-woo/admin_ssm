package cn.cqupt.utils;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

public class BCryptPasswordEncoderUtils {
    private static BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
    public static String encoding(String str){
        return encoder.encode(str);
    }

    public static void main(String[] args) {

        System.out.println(encoding("tom"));
    }
}
