package com.blog.dao.conn;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class DataManager implements DataManagerimpl {

	static DataSource ds = null;

	public DataManager() {
		try {
			// 初始化上下文
			Context context = new InitialContext();
			// 线程同步
			synchronized (this) {
				if (ds == null) {
					// 获得数据源
					ds = (DataSource) context.lookup("java:/comp/env/jdbc/blog");
				}
			}

		} catch (NamingException e) {
			e.printStackTrace();
		}
	}

	@Override
	// 创建连接对象
	public Connection createConnection() throws SQLException {
		// 返回数据源的连接对象
		return ds.getConnection();
	}

	@Override
	// 增删改操作，不带参数
	public int updateExecuted(String sql) {
		return this.updateExecuted(sql, null);
	}

	@Override
	// 增删改操作，带参数
	public int updateExecuted(String sql, ParamSetimpl params) {
		int row = 0;
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			conn = createConnection();
			// 预处理sql语句
			ps = conn.prepareStatement(sql);
			if (params != null) {
				params.setParams(ps);
			}
			row = ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			this.close(conn, ps, rs);
		}
		return row;
	}

	@Override
	// 查询操作，不带参数
	public <T> T query(String sql, RowDatas<T> rowDatas) {
		return query(sql, null, rowDatas);
	}

	@Override
	// 查询单个结果，带参数
	// 依赖于sql语句，因为返回的是List集合的第0个对象，很有可能不是我们想要要的结果，所以依赖于sql语句的精确度
	public <T> T query(String sql, ParamSetimpl params, RowDatas<T> rowDatas) {
		List<T> list = queryList(sql, params, rowDatas);
		if (list != null && list.size() > 0) {
			return list.get(0);
		}
		return null;
	}

	@Override
	// 查询多个结果，不带参数
	public <T> List<T> queryList(String sql, RowDatas<T> rowDatas) {
		return queryList(sql, null, rowDatas);
	}

	@Override
	// 查询多个结果，带参数
	public <T> List<T> queryList(String sql, ParamSetimpl params, RowDatas<T> rowDatas) {
		List<T> list = new ArrayList<T>();
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			conn = createConnection();
			ps = conn.prepareStatement(sql);
			if (params != null) {
				params.setParams(ps);
			}
			rs = ps.executeQuery();
			while (rs.next()) {
				list.add(rowDatas.getRowData(rs));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			this.close(conn, ps, rs);
		}
		return list;
	}

	public void close(Connection conn, PreparedStatement ps, ResultSet rs) {
		// 关闭数据结果集
		if (rs != null) {
			try {
				rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		// 关闭预处理语句
		if (ps != null) {
			try {
				ps.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		// 关闭连接操作
		if (conn != null) {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

}