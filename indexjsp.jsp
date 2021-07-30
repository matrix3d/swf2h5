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
	int numpage=(int)(Math.ceil((float)fileNames.length/numPrePage));
%>


<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Jekyll v3.8.5">
    <title>小游戏</title>

    <link rel="canonical" href="https://getbootstrap.com/docs/4.3/examples/album/">

    <!-- Bootstrap core CSS -->
<link href="style/bootstrap.min.css" rel="stylesheet" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">


    <style>
      .bd-placeholder-img {
        font-size: 1.125rem;
        text-anchor: middle;
        -webkit-user-select: none;
        -moz-user-select: none;
        -ms-user-select: none;
        user-select: none;
      }

      @media (min-width: 768px) {
        .bd-placeholder-img-lg {
          font-size: 3.5rem;
        }
      }
    </style>
    <!-- Custom styles for this template -->
    <link href="style/album.css" rel="stylesheet">
  </head>
  <body>
    <header>
  <div class="collapse bg-dark" id="navbarHeader">
    <div class="container">
      <div class="row">
        <div class="col-sm-8 col-md-7 py-4">
          <h4 class="text-white">About</h4>
          <p class="text-muted">小游戏大全</p>
        </div>
        <div class="col-sm-4 offset-md-1 py-4">
          <h4 class="text-white">Contact</h4>
          <ul class="list-unstyled">
            <li><a href="#" class="text-white">关注公众号</a></li>
            <li><a href="#" class="text-white">官网</a></li>
            <li><a href="#" class="text-white">Email me</a></li>
          </ul>
        </div>
      </div>
    </div>
  </div>
  <div class="navbar navbar-dark bg-dark shadow-sm">
    <div class="container d-flex justify-content-between">
      <a href="#" class="navbar-brand d-flex align-items-center">
        <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" aria-hidden="true" class="mr-2" viewBox="0 0 24 24" focusable="false"><path d="M23 19a2 2 0 0 1-2 2H3a2 2 0 0 1-2-2V8a2 2 0 0 1 2-2h4l2-3h6l2 3h4a2 2 0 0 1 2 2z"/><circle cx="12" cy="13" r="4"/></svg>
        <strong>小游戏</strong>
      </a>
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarHeader" aria-controls="navbarHeader" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
    </div>
  </div>
</header>

<main role="main">

  <section class="jumbotron text-center">
    <div class="container">
      <h1 class="jumbotron-heading">小游戏</h1>
      <p class="lead text-muted">很多小游戏，可以下载和查看</p>
      <p>
        <a href="#" class="btn btn-primary my-2">文件</a>
        <a href="#" class="btn btn-secondary my-2">帮助</a>
      </p>
    </div>
  </section>

  <div class="album py-5 bg-light">
    <div class="container">

      <div class="row">
	  
		<%for(int i=0;i<numPrePage;i++){
			int j=i+numPrePage*pagenum;
			if(j<fileNames.length){
			String str = fileNames[j];
			%>
		 <div class="col-md-3">
          <div class="card mb-3 shadow-sm">
            <img src="<%=swfpath%>/<%=str.replace(".swf",".jpg")%>" class="bd-placeholder-img card-img-top" width="100%" height="100%" xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMidYMid slice" focusable="false" role="img" aria-label="Placeholder: Thumbnail"><title>Placeholder</title>
			
			</img>
            <div class="card-body">
              <p class="card-text"><%=str.replace(".swf","")%></p>
              <div class="d-flex justify-content-between align-items-center">
                <div class="btn-group">
                  <a href="game.html?swf=<%=swfpath%>/<%=str%>" target="_blank" class="btn btn-sm btn-outline-secondary">View</a>
                  <a href="<%=swfpath%>/<%=str%>" target="_blank" class="btn btn-sm btn-outline-secondary">下载</a>
                </div>
                <small class="text-muted">9 mins</small>
              </div>
            </div>
          </div>
        </div>
			<%}}%>
      </div>
    </div>
  </div>
  
  <div class="bg-light">
    <div class="container">
      <div class="row">
        <div class="col-sm-4 offset-md-1 py-4">
          <div class="btn-group">
				<%
					int i=pagenum-5;
					if(i<0){
						i=0;
					}
					int len=i+10;
					if(len>numpage){
						len=numpage;
					}
						Enumeration<String> paraNames = request.getParameterNames();
						String p="?";
						while(paraNames.hasMoreElements()){
							String paraKey = paraNames.nextElement();
						 
							String paraValue  = request.getParameter(paraKey);
							if(!paraKey.equals("page")){
								p+=paraKey + "=" + paraValue+"&";
							}
						}
					for(;i<len;i++){
				%>
              <a href="<%=request.getRequestURI()+p+"page="+i%>" class="btn btn-sm <%=i==pagenum?"btn-secondary":"btn-outline-secondary"%>"><%=(i+1)%></a>
				<%}%>
           </div>
        </div>
      </div>
    </div>
  </div>

</main>


<footer class="text-muted">
  <div class="container">
    <p class="float-right">
      <a href="#">Back to top</a>
    </p>
    <p>小游戏大全 &copy; 上海小游戏, 请下载查看!</p>
    <p>查看帮助</p>
  </div>
</footer>
</body>
</html>





