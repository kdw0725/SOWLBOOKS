package com.sowl.sowlbooks.VO;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter@Setter
@ToString
public class SearchCriteria extends Criteria{
	private String keyword;
}
