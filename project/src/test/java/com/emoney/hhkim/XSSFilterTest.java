package com.emoney.hhkim;

import org.junit.Test;

import com.nhncorp.lucy.security.xss.XssPreventer;

public class XSSFilterTest {	
	
	@Test
	public void testXssPreventer() {
	    String dirty = "\"><script>alert('ÇÑ±Û');</script>";
	    String clean = XssPreventer.escape(dirty);
	    System.out.println(clean);
	}
}
