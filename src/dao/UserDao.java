package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import entities.User;

public class UserDao {
	static Connection con=null;
	
	public static boolean connectDB(){
		String driver="com.mysql.jdbc.Driver";
		String url="jdbc:mysql://localhost:3306/test?characterEncoding=utf-8";//preparedStatement乱码问题
		String user="root";
		String pwd="";
		try{
			Class.forName(driver);
			con=DriverManager.getConnection(url,user,pwd);
			if(!con.isClosed())
				System.out.println("succeed in connecting DB");
//			Statement st=con.createStatement();
//			String sql="select * from students where age=22";
//			ResultSet rs=st.executeQuery(sql);
//			while(rs.next()){
//				System.out.print(rs.getString("name")+'\t');
//			}
//			
		}catch(ClassNotFoundException e){
			System.out.println("Not Find Driver");
			return false;
		}
		catch(SQLException e){
			e.printStackTrace();
			return false;
		}
		return true;
	}
	
	public static void cutDownCon(){
		if(con!=null){
			try {
				con.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}		
	}
	
	public boolean isLogSuccess(String username,String password) throws SQLException{
		UserDao.connectDB();
		if(con==null){
			System.out.println("DB fail");
			return false;
		}
		String sql="select password from users where username=?";
//		System.out.println(username+"!!!!!!!!");
		PreparedStatement pst=con.prepareStatement(sql);
		pst.setString(1, username);
		System.out.println(pst.toString());
		ResultSet rst=pst.executeQuery();
		if(!rst.next()){
			System.out.println("没有此用户");
		}
		else{
			String realPwd=rst.getString("password");
			if(password.equals(realPwd)){
				rst.close();
				return true;
			}
		}
		rst.close();
		return false;
	}
}
