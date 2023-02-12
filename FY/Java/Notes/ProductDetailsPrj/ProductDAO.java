import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class ProductDAO {
	String dbDriver = "com.mysql.jdbc.Driver";
	String dbURL = "jdbc:mysql://localhost:3306/testschema";
	String username = "root";
	String pwd = "root";
	Connection dbCon;

	private boolean connectToDtbc() throws SQLException, ClassNotFoundException {
		Class.forName(dbDriver);
		dbCon = DriverManager.getConnection(dbURL, username, pwd);
		return true;
	}

	public boolean insertRecord(Product proObj) {
		String insertQueryStr = "Insert into producttable values(?,?,?,?,?)";

		try {
			if (connectToDtbc()) {
				PreparedStatement ppStmt = dbCon.prepareStatement(insertQueryStr);
				ppStmt.setInt(1, proObj.getProductId());
				ppStmt.setString(2, proObj.getProductName());
				ppStmt.setInt(3, proObj.getProductQty());
				ppStmt.setInt(4, proObj.getProductPrice());
				ppStmt.setString(5, proObj.getProductType());
				ppStmt.executeUpdate();
				ppStmt.close();
				dbCon.close();
				return true;
			} else {
				return false;
			}
		} catch (Exception e) {
			System.err.println(e);
			return false;
		}

	}
}
