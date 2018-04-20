package com.blog.dao.conn;

import java.sql.PreparedStatement;
import java.sql.SQLException;

public interface ParamSetimpl {
	void setParams(PreparedStatement pstm) throws SQLException;
}


