<%@page import="java.io.IOException"%>
<%@page import="com.google.zxing.WriterException"%>
<%@page import="javax.imageio.ImageIO"%>
<%@page import="java.awt.image.BufferedImage"%>
<%@page import="java.io.File"%>
<%@page import="com.google.zxing.BarcodeFormat"%>
<%@page import="com.google.zxing.client.j2se.MatrixToImageWriter"%>
<%@page import="com.google.zxing.qrcode.QRCodeWriter"%>
<%@page import="com.google.zxing.common.BitMatrix"%>
<%@page import="java.util.Calendar"%>
<%@ page contentType="application/json;charset=utf-8"%>

<%	
	String url = request.getParameter("url");
	QRCodeWriter writer = new QRCodeWriter();
	try {								//웹사이트											//크기조절
		BitMatrix qrCode = writer.encode("http://www.naver.com", BarcodeFormat.QR_CODE, 300, 300);
		BufferedImage qrImage = MatrixToImageWriter.toBufferedImage(qrCode);
		String path = request.getRealPath("/upload/qrcode");
		System.out.println(path);
		Calendar c = Calendar.getInstance();
		int year = c.get(Calendar.YEAR);
		int month = c.get(Calendar.MONTH)+1;
		
		path += "\\"+year+"\\"+month;
		File f = new File(path);
		if(!f.exists()){
			f.mkdirs();
		}
		long currentMills = System.currentTimeMillis();
		File f2 = new File(f, currentMills+".png");
		boolean isSuccess = ImageIO.write(qrImage,"PNG",f2);
		if(isSuccess){
			%>
			{"result" : "ok", "path" :
			"/upload/qrcode/<%=year %>/<%=month %>/<%=currentMills %>.png"}
			<%
		}else{
			%>
			{"result" : "fail"}
			<%
		}
	} catch (WriterException e) {
		e.printStackTrace();
	} catch (IOException e) {
		e.printStackTrace();
	} 
%>