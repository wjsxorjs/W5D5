<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Ex1_index</title>
<style>
    #box{
        width: 400px;
        height: 250px;
        border: 1px solid #000;

    }
</style>
</head>
<body>
    <button type="button" id="btn">비동기식 통신</button>
    <br/>
    <div id="box"></div>
</body>

<script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
<script>
    $(function(){
        $("#btn").bind("click",function(){
            //버튼을 클릭할 때마다 수행하는 곳.

            // 서버에 비동기식 통신을 보낸다.
            $.ajax({
                url: "Ex1_Ajax.jsp",    // 호츨하고자하는 URL 경로
                type: "GET",              // 요청 방법(GET/POST)
                data: "",                // 인자 전달
            }).done(function(res){      // 서버로부터 전달되어오는 결과를
                                        // 인자로 받는다.
                $("#box").html(res);

            });
        });
    });
</script>
</html>