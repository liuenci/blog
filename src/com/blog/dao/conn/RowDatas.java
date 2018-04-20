package com.blog.dao.conn;

import java.sql.ResultSet;
import java.sql.SQLException;

public interface RowDatas<T> {
	public T getRowData(ResultSet rs) throws SQLException;
}
