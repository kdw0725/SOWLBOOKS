package com.sowl.sowlbooks.VO;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter@Setter
@ToString
public class noticeVO {
	private int 	notice_no;
	private int 	no;
	private String  notice_title;
	private String  notice_content;
	private String  notice_insertdate;
	private String  notice_writer;
	private boolean notice_delflag;
}
