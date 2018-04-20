package com.blog.dao.conn;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

public interface DataManagerimpl {

	Connection createConnection() throws SQLException;

	int updateExecuted(String sql);

	int updateExecuted(String sql, ParamSetimpl params);

	<T> T query(String sql, RowDatas<T> rowDatas);

	<T> T query(String sql, ParamSetimpl params, RowDatas<T> rowDatas);

	<T> List<T> queryList(String sql, RowDatas<T> rowDatas);

	<T> List<T> queryList(String sql, ParamSetimpl params, RowDatas<T> rowDatas);

}
