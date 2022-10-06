package cs.dit.member;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class MemberDao {

	/**======================================================================
	 * 패키지명 : cs.dit.Member
	 * 파일명   : MemberDao.java
	 * 작성자  : 
	 * 변경이력 : 
	 *   2022-10-3
	 * 프로그램 설명 : Member 테이블의 내용과 연동하여 게시글 관리
	*======================================================================*/

	private Connection getConnection() throws Exception{
		
		Context initCtx  = new InitialContext();//1. JNDI를 이용하기 위한 객체 생성
		
		Context envCtx = (Context) initCtx.lookup("java:comp/env");//2. 등록된 네이밍 서비스로부터 등록된 자원을 가져옴
		
		DataSource ds = (DataSource) envCtx.lookup("jdbc/hyunah");//3. 자원들 중 원하는 jdbc/hyunah 자원을 찾아내어 데이터소스를 가져옴
		
		Connection con = ds.getConnection();//4. 커넥션 얻어옴
		
		return con;
	}
	
	public void insert(MemberDto dto) {
		String sql = "INSERT INTO member(id, pwd, name, email,joindate) VALUES(?, ?, ?, ?, SYSDATE())";
		
		try (
			Connection con = getConnection();
			PreparedStatement pstmt = con.prepareStatement(sql);
		)
		{   
			pstmt.setString(1,  dto.getId());
			pstmt.setString(2,  dto.getPwd());
			pstmt.setString(3,  dto.getName());
			pstmt.setString(4,  dto.getEmail());

			
			//1. insert 문을 실행하는 코드를 작성하세요
			pstmt.executeUpdate();
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public ArrayList<MemberDto> list(int page, int numOfRecords){
	      String sql = "SELECT * FROM member order by id desc limit ?,?";
	      ArrayList<MemberDto> dtos = new ArrayList<MemberDto>();
	      
	      try (   Connection con = getConnection();
	            PreparedStatement pstmt = con.prepareStatement(sql);
	         )
	         {
	            pstmt.setInt(1, (page-1)*numOfRecords);
	            pstmt.setInt(2, numOfRecords);
	         
	            try(ResultSet rs = pstmt.executeQuery();)
	            {
	               while(rs.next()) {
	                  MemberDto dto = new MemberDto();
	                  
	                  dto.setId(rs.getString("id"));
	                  dto.setPwd(rs.getString("pwd"));
	                  dto.setName(rs.getString("name"));
	                  dto.setEmail(rs.getString("email"));
	                  dto.setJoindate(rs.getDate("joindate"));
	                  
	                  //2. 위에서 만들어진 dto를 ArrayList 인 dtos에 차례로 입력하세요.
	                     dtos.add(dto);   
	               }

	            } catch (Exception e) {
	               e.printStackTrace();
	            } 
	         } catch (Exception e) {
	            e.printStackTrace();
	         }
	      return dtos;
	   }
	   
	
	public MemberDto selectOne(String id) {
		
		//3. 전달받은 bcode를 가진 레코드를 검색하는 select 문을 아래에 작성하세요.
		String sql = "select * from member where id = ?";
		
		
		MemberDto dto = new MemberDto();
		
		try (	Connection con = getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql);
				)
		{	pstmt.setString(1, id);
		
			try(ResultSet rs = pstmt.executeQuery();)
			{
				rs.next();
				
				dto.setId(rs.getString("id"));
				dto.setPwd(rs.getString("pwd"));
				dto.setName(rs.getString("name"));
				dto.setEmail(rs.getString("email"));
				dto.setJoindate(rs.getDate("joindate"));
				
			}catch (Exception e) {
				e.printStackTrace();
			}
		
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}
	
	public void update(MemberDto dto) {
		String sql = "UPDATE member SET pwd = ?, name = ?, email = ?, joindate = ? WHERE id =?";
		
		try (
			Connection con = getConnection();
			PreparedStatement pstmt = con.prepareStatement(sql);
		)
		{
			pstmt.setString(1,  dto.getPwd());
			pstmt.setString(2,  dto.getName());
			pstmt.setString(3,  dto.getEmail());
			pstmt.setDate(4,  (Date) dto.getJoinDate());
			pstmt.setString(5, dto.getId());
			
			pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}		
	}
	
	public void delete(String id) {
		String sql = "DELETE FROM member WHERE id =?";
		
		try (
			Connection con = getConnection();
			PreparedStatement pstmt = con.prepareStatement(sql);
		)
		{
			pstmt.setString(1, id);
			
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}		
	}

	public int recordCount() {
	      int count = 0;
	      String sql = "select count(id) from member";
	      
	      try (   Connection con = getConnection();
	            Statement stmt = con.createStatement();
	            ResultSet rs = stmt.executeQuery(sql);
	         ){
	            rs.next();
	            count = rs.getInt(1);
	      } catch (Exception e) {   
	         e.printStackTrace();
	      }
	      
	      return count;
	   }
}
