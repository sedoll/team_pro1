package com.chunjae.util;

import com.chunjae.db.DBC;
import com.chunjae.db.MariaDBCon;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class FeedDAO {
    public boolean insert(String uid, String ucontent, String uimages) {
        DBC con = new MariaDBCon();
        Connection conn = null;
        PreparedStatement pstmt = null;
        boolean check = false;
        try {
            String sql = "insert into feed(id, content, images) values(?, ?, ?)";
            conn = con.connect();
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, uid);
            pstmt.setString(2, ucontent);
            pstmt.setString(3, uimages);
            int cnt = pstmt.executeUpdate();
            if (cnt > 0) {
                System.out.println("업로드 성공");
                check = true;
            } else {
                System.out.println("업로드 실패");
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            con.close(pstmt, conn);
        }
        return check;
    }

    public ArrayList<FeedObj> getList() {
        DBC con = new MariaDBCon();
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        ArrayList<FeedObj> feeds = new ArrayList<>();
        String sql = "select * from feed order by ts desc";
        conn = con.connect();
        try {
            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();
            while(rs.next()) {
                FeedObj obj = new FeedObj();
                obj.setId(rs.getString("id"));
                obj.setContent(rs.getString("content"));
                obj.setTs(rs.getString("ts"));
                obj.setImages(rs.getString("images"));
                feeds.add(obj);
            }
            return feeds;
        } catch (SQLException e) {
            System.out.println("feed 출력 에러");
            throw new RuntimeException(e);
        }
    }
}
