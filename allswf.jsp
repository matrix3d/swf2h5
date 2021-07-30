<%@page session="false" import="java.io.*,java.util.Enumeration" pageEncoding="UTF-8"%>
<%
	String path=application.getRealPath(request.getServletPath());
	File file=new java.io.File(path);
	String[] fileNames = null;
	if(!file.isDirectory()){
		file=file.getParentFile();
	}
	String swfpath=request.getParameter("path");
	if(swfpath==null){
		swfpath="swf";
	}
	String pageStr=request.getParameter("page");
	if(pageStr==null){
		pageStr="0";
	}
	int pagenum=Integer.parseInt(pageStr);
	int numPrePage=16;
	file=new File(file.getPath()+"/"+swfpath);
	if(file.exists()){
		fileNames = file.list(new FilenameFilter(){
			public boolean accept(File f, String fname){
				return fname.toLowerCase().endsWith(".swf");
			}
		});
	}else{
		fileNames=new String[0];
	}
	String outstr="";
	for(int i=0;i<fileNames.length;i++){
		outstr+="\""+fileNames[i]+"\",";
	}
%>
<%=outstr%>





