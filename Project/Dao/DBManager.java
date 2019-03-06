package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBManager {
	final private static String URL = "jdbc:mysql://localhost/example?useUnicode=true&characterEncoding=utf8";
	//final private static String DB_NAME = "example";
    final private static String USER = "root";
    final private static String PASS = "password";

    /**
     * DBへ接続するコネクションを返す
     */
    public static Connection getConnection() {
        Connection con = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection(URL/*+DB_NAME:*/,USER,PASS);
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
        return con;
    }
}

//暗号化。
////ハッシュを生成したい元の文字列
//String source = "暗号化対象";
////ハッシュ生成前にバイト配列に置き換える際のCharset
//Charset charset = StandardCharsets.UTF_8;
////ハッシュアルゴリズム
//String algorithm = "MD5";
//
////ハッシュ生成処理
//byte[] bytes = MessageDigest.getInstance(algorithm).digest(source.getBytes(charset));
//String result = DatatypeConverter.printHexBinary(bytes);
////標準出力
//System.out.println(result);
