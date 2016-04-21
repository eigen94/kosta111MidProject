package kosta.imageAction;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface ImgAction {
	public ImgActionForward execute(HttpServletRequest request, HttpServletResponse response);
}
