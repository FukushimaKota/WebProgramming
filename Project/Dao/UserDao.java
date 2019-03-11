package dao;

import java.nio.charset.Charset;
import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import javax.xml.bind.DatatypeConverter;

import model.User;

/**
 * ユーザテーブル用のDao
 *
 */
public class UserDao {

	/**
	 * ログインIDとパスワードに紐づくユーザ情報を返す
	 * @param loginId
	 * @param password
	 * @return
	 */
	public User LoginData(String loginId, String password) {
		Connection conn = null;
		try {
			// データベースへ接続
			conn = DBManager.getConnection();
			// SELECT文を準備
			String sql = "SELECT * FROM user WHERE login_id = ? and password = ?";

			//ハッシュを生成したい元の文字列
			String source = password;
			//ハッシュ生成前にバイト配列に置き換える際のCharset
			Charset charset = StandardCharsets.UTF_8;
			//ハッシュアルゴリズム
			String algorithm = "MD5";
			//ハッシュ生成処理
			byte[] bytes = MessageDigest.getInstance(algorithm).digest(source.getBytes(charset));
			String result = DatatypeConverter.printHexBinary(bytes);

			String password2 = result;

			// SELECTを実行し、結果表を取得
			PreparedStatement pStmt = conn.prepareStatement(sql);
			pStmt.setString(1, loginId);
			pStmt.setString(2, password2);
			ResultSet rs = pStmt.executeQuery();

			// 主キーに紐づくレコードは1件のみなので、rs.next()は1回だけ行う
			if (!rs.next()) {
				return null;
			}

			String loginIdData = rs.getString("login_id");
			String nameData = rs.getString("name");
			return new User(loginIdData, nameData);

		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		} catch (NoSuchAlgorithmException e) {
			// TODO 自動生成された catch ブロック
			e.printStackTrace();
		} finally {
			// データベース切断
			if (conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
					return null;
				}
			}
		}
		return null;
	}

	//新規登録
	public void Insert(String loginId, String password, String name, String birthday) {
		Connection conn = null;
		try {
			// データベースへ接続
			conn = DBManager.getConnection();
			String sql = "INSERT INTO user(login_id, name, birth_date, password, create_date, update_date) VALUES (?, ?, ?, ?, now(),now())";

			//ハッシュを生成したい元の文字列
			String source = password;
			//ハッシュ生成前にバイト配列に置き換える際のCharset
			Charset charset = StandardCharsets.UTF_8;
			//ハッシュアルゴリズム
			String algorithm = "MD5";
			//ハッシュ生成処理
			byte[] bytes = MessageDigest.getInstance(algorithm).digest(source.getBytes(charset));
			String result = DatatypeConverter.printHexBinary(bytes);

			String password2 = result;

			// INSERTを実行
			PreparedStatement stmt = conn.prepareStatement(sql);
			stmt.setString(1, loginId);
			stmt.setString(2, name);
			stmt.setString(3, birthday);
			stmt.setString(4, password2);
			int result2 = stmt.executeUpdate();

			// 追加された行数を出力
			System.out.println(result2);
			stmt.close();
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (NoSuchAlgorithmException e) {
			// TODO 自動生成された catch ブロック
			e.printStackTrace();
		} finally {
			if (conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
	}

	//新規登録画面でIDの被りを確認
	public String IdSearch(String loginId) {
		Connection conn = null;
		try {
			// データベースへ接続
			conn = DBManager.getConnection();

			// SELECT文を準備
			String sql = "SELECT * FROM user WHERE login_id = ?";

			PreparedStatement stmt = conn.prepareStatement(sql);
			stmt.setString(1, loginId);

			// SELECTを実行し、結果表を取得
			ResultSet rs = stmt.executeQuery();

			// 結果表に格納されたレコードの内容を
			// Userインスタンスに設定し、ArrayListインスタンスに追加
			while (rs.next()) {
				String loginID = rs.getString("login_id");

				return loginID;
			}
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		} finally {
			// データベース切断
			if (conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
					return null;
				}
			}
		}
		return null;
	}

	//ユーザ一覧
	//検索機能   allのコピペ、検索機能
	public ArrayList<User> UserList(String loginId, String name, String birthday, String birthday2) {
		Connection conn = null;
		ArrayList<User> userList =new ArrayList<User>();
		try {
			// データベースへ接続
			conn = DBManager.getConnection();

			// SELECT文を準備
			String sql = "SELECT * FROM user WHERE id <> 1";

			//空欄か
			boolean a1 = loginId.isEmpty();
			boolean a2 = name.isEmpty();
			boolean a3 = birthday.isEmpty();
			boolean a4 = birthday2.isEmpty();

			//それぞれ結合+=で増やす
			//sql文？String sql = "SELECT * FROM user"の続き
			//空じゃ無い時。//WHEREとAND
			if (a1 != true) {//null?
				sql += " AND login_id ='"+loginId+"'";
			}
			if (a2 != true) {
				sql += " AND name LIKE '%"+name+"%'";
			}
			if (a3 != true) {
				sql += " AND birth_date >= '"+birthday+"' ";
			}
			if (a4 != true) {
				sql += " AND birth_date <= '"+birthday2+"' ";
			}

			// SELECTを実行し、結果表を取得
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(sql);
			// 結果表に格納されたレコードの内容を
            // Userインスタンスに設定し、ArrayListインスタンスに追加
            while (rs.next()) {
                int id = rs.getInt("id");
                String login_Id = rs.getString("login_id");
                String na_me = rs.getString("name");
                Date birthDate = rs.getDate("birth_date");
                String password = rs.getString("password");
                String createDate = rs.getString("create_date");
                String updateDate = rs.getString("update_date");

                User user = new User(id, login_Id, na_me, birthDate, password, createDate, updateDate);

                userList .add(user);
            }
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        } finally {
            // データベース切断
            if (conn != null) {
                try {
                    conn.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                    return null;
                }
            }
        }
        return userList;
    }

	//全件UserListに表示
	public ArrayList<User> AllUser() {
		Connection conn = null;
		ArrayList<User> userList = new ArrayList<User>();

		try {
			// データベースへ接続
			conn = DBManager.getConnection();

			// SELECT文を準備
			//管理者（admin）は出さない。
			String sql = "SELECT * FROM user WHERE 1 < id";

			// SELECTを実行し、結果表を取得
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(sql);

			// 結果表に格納されたレコードの内容を
			// Userインスタンスに設定し、ArrayListインスタンスに追加
			while (rs.next()) {
				int id = rs.getInt("id");
				String loginId = rs.getString("login_id");
				String name = rs.getString("name");
				Date birthDate = rs.getDate("birth_date");
				String password = rs.getString("password");
				String createDate = rs.getString("create_date");
				String updateDate = rs.getString("update_date");

				User user = new User(id, loginId, name, birthDate, password, createDate, updateDate);

				userList.add(user);
			}
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		} finally {
			// データベース切断
			if (conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
					return null;
				}
			}
		}
		return userList;
	}

	//ユーザ情報
	public User UserData(String id) {
		Connection conn = null;
		try {
			// データベースへ接続
			conn = DBManager.getConnection();
			String sql = "SELECT * FROM user WHERE id = ?";
			// SELECTを実行し、結果表を取得
			PreparedStatement stmt = conn.prepareStatement(sql);
			stmt.setString(1, id);
			ResultSet rs = stmt.executeQuery();

			// 結果表に格納されたレコードの内容
			if (rs.next()) {
				int ida = rs.getInt("id");
				String loginId = rs.getString("login_id");
				String name = rs.getString("name");
				Date birthDate = rs.getDate("birth_date");
				String password = rs.getString("password");
				String createDate = rs.getString("create_date");
				String updateDate = rs.getString("update_date");

				return new User(ida, loginId, name, birthDate, password, createDate, updateDate);
			}
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		} finally {
			// データベース切断
			if (conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
					return null;
				}
			}
		}
		return null;
	}

	public void Update(String id, String password, String name, String birthday) {
		Connection conn = null;
		try {
			// データベースへ接続
			conn = DBManager.getConnection();
			String sql = "UPDATE user SET name = ?,password = ?,birth_date = ?,update_date = now() WHERE id = ?";

			//ハッシュを生成したい元の文字列
			String source = password;
			//ハッシュ生成前にバイト配列に置き換える際のCharset
			Charset charset = StandardCharsets.UTF_8;
			//ハッシュアルゴリズム
			String algorithm = "MD5";
			//ハッシュ生成処理
			byte[] bytes = MessageDigest.getInstance(algorithm).digest(source.getBytes(charset));
			String result = DatatypeConverter.printHexBinary(bytes);

			String password2 = result;

			//
			//UPDATEを実行
			PreparedStatement stmt = conn.prepareStatement(sql);
			stmt.setString(1, name);
			stmt.setString(2, password2);
			stmt.setString(3, birthday);
			stmt.setString(4, id);
			int result2 = stmt.executeUpdate();

			// 追加された行数を出力
			System.out.println(result2);
			stmt.close();

		} catch (SQLException e) {
			e.printStackTrace();
		} catch (NoSuchAlgorithmException e) {
			// TODO 自動生成された catch ブロック
			e.printStackTrace();
		} finally {
			if (conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
	}

	//update passなし
	public void Update2(String id, String name, String birthday) {
		Connection conn = null;
		try {
			// データベースへ接続
			conn = DBManager.getConnection();
			String sql = "UPDATE user SET name = ?,birth_date = ?,update_date = now() WHERE id = ?";

			//UPDATEを実行(passなし)
			PreparedStatement stmt = conn.prepareStatement(sql);
			stmt.setString(1, name);
			stmt.setString(2, birthday);
			stmt.setString(3, id);
			int result = stmt.executeUpdate();

			// 追加された行数を出力
			System.out.println(result);
			stmt.close();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
	}

	public User Delete(String id) {
		Connection conn = null;
		try {
			// データベースへ接続
			conn = DBManager.getConnection();
			String sql = "DELETE FROM user WHERE id = ?";
			// SELECTを実行し、結果表を取得
			PreparedStatement stmt = conn.prepareStatement(sql);
			stmt.setString(1, id);
			int result = stmt.executeUpdate();
			// 追加された行数を出力
			System.out.println(result);
			stmt.close();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			// データベース切断
			if (conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		return null;
	}

}