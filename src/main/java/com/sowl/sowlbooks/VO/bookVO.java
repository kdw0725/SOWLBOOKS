package com.sowl.sowlbooks.VO;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter@Setter
@ToString
public class bookVO {
	private int		book_no;
	private int		no;
	private String  book_name;
	private String  book_author;
	private String  book_publisher;
	private String  book_insertdate;
	private boolean book_delflag;
	
}
