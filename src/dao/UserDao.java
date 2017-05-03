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
	//登录功能
	public User isLogSuccess(String email,String password) throws SQLException{
		UserDao.connectDB();
		String sql="select password,username from users where email=?";
//		System.out.println(username+"!!!!!!!!");
		PreparedStatement pst=con.prepareStatement(sql);
		pst.setString(1, email);
		
		ResultSet rst=pst.executeQuery();
		if(!rst.next()){
			System.out.println("没有此用户");
		}
		else{
			String realPwd=rst.getString("password");
			if(password.equals(realPwd)){
				User user=new User();
				user.setUsername(rst.getString("username"));
				rst.close();
				return user;
			}
		}
		rst.close();
		return null;
	}
	
	public boolean isSignUpSuccess(User user) throws SQLException{
		UserDao.connectDB();
		if(this.isExistUser(user.getEmail(), con)){
			return false;
		}
		String sql="insert into users values(?,?,?,?,?)";
		PreparedStatement pst=con.prepareStatement(sql);
		//pst.setString(1, email);//将email填入预备语句
		pst.setString(1, user.getId());
		pst.setString(2, user.getUsername());
		pst.setString(3, user.getPassword());
		pst.setString(4, user.getEmail());
		pst.setString(5, "1");
		
		pst.executeUpdate();
		
		UserDao.cutDownCon();
		return true;
	}
	public boolean isExistUser(String email,Connection con) throws SQLException{
		String sql="select password from users where email=?";
		PreparedStatement pst=con.prepareStatement(sql);
		pst.setString(1, email);//将email填入预备语句
		
		ResultSet rst=pst.executeQuery();
		if(!rst.next()){
			return false;
		}
		rst.close();
		return true;
	}
	
}
