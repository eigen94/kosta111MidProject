package kosta.imageAction;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

import kosta.imgModel.Image;
import kosta.imgModel.ImageUtil;
import kosta.imgService.ImageService;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class ImgFileAction implements ImgAction {

	@Override
	public ImgActionForward execute(HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		
		ImageService service = ImageService.getInstance();
		String uploadPath = request.getRealPath("imgUpload");
		int size =20 * 1024*1024;//20mb
		
		MultipartRequest multi = new MultipartRequest(request, uploadPath, size, "utf-8", new DefaultFileRenamePolicy());
		
		String fname = multi.getFilesystemName("check_urlId");
		String ftext = multi.getParameter("check_textArea");
		
		JSONParser parser = new JSONParser();
		JSONObject obj = new JSONObject();
		JSONArray loadJsonArrFromDb = new JSONArray();
		
		obj.put("fname", fname);
		obj.put("ftext", ftext);
		//기존 내용 로드 후, 리스트에 추가 할 것.
		int check_id = Integer.parseInt(multi.getParameter("check_id"));
		int check_projeckid = Integer.parseInt(multi.getParameter("check_projectid"));
		String getListStr = service.listImgBoardService(check_id);
		try {
			if(getListStr.equals("")){
			}else{
				loadJsonArrFromDb = (JSONArray)parser.parse(getListStr);
			}
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		loadJsonArrFromDb.add(obj);
		
//		JSONArray jsonArr = new JSONArray();
//		jsonArr.add(obj);
		
		
//		String content = multi.getFilesystemName("check_urlId")+","+multi.getParameter("check_textArea");
		String content = loadJsonArrFromDb.toString();
		System.out.println(content);
		//파일 업로드일때
		if(multi.getFilesystemName("check_urlId")!=null){
			String check_urlId = multi.getFilesystemName("check_urlId");
			
			//썸네일 이미지(jpg,gif) aaa.gif => aaa_small.gif
			String pattern = check_urlId.substring(check_urlId.lastIndexOf(".")+1);
			String headName = check_urlId.substring(0,check_urlId.lastIndexOf("."));
			
			//원본 파일 이미지 -> 객체화
			String imagePath = uploadPath + "//" + check_urlId;
			
			File src = new File(imagePath);
			
			//썸네일 이미지 -> 객체화
			String thumImagePath = uploadPath + "//" + headName + "_small." + pattern;
			
			File dest = new File(thumImagePath);
			
			//썸네일 이미지 생성
			if(pattern.equalsIgnoreCase("jpg")||pattern.equalsIgnoreCase("gif")||pattern.equalsIgnoreCase("png")){
			
				ImageUtil.resize(src, dest, 100, ImageUtil.RATIO);
			}
			
		}else{
			/*board.setB_fname("");*/
		}
		
//		add check_id for change logic insert -> update 
		
		
		Image img = new Image();
		img.setImgCheck_id(check_id);
		img.setImgCheck_content(content);
		
		service.imgInsertService(img);
		ImgActionForward forward = new ImgActionForward();
		forward.setRedirect(true);
		
		forward.setPath("checkListDetail.jsp?check_id="+check_id+"&check_projectid="+check_projeckid);
//		forward.setPath("imgListBoard.img");
		return forward;
	}
}
