<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Ex2_Index</title>
<style>
    #t1{
        width: 500px;
        border-collapse: collapse;
    }

    #t1 th{
        border: 1px solid #999999;
        padding: 4px;
        background-color: #dedede;
    }

    #t1 td{
        border: 1px solid #999999;
        padding: 4px;
    }

    #t1 caption{
        text-indent: -9999px;
    }


</style>
</head>
<body>
	<div id="wrap">
        <header>
            <h1>비동기식 통신 연습</h1>
        </header>
        <article>
            <button type="button" id="btn">비동기식 통신</button>
            <label for="numIn">번호: </label>
            <input type="number" id="numIn" min="1" max="20" value="1" readonly/>
            <button type="button" id="numUp">+</button>
            <button type="button" id="numDown">-</button>

            <table id="t1">
                <caption>번호 테이블</caption>
                <thead>
                    <tr>
                        <th>번호</th>
                        <th>제목</th>
                        <th>등급</th>
                    </tr>
                </thead>
                <tbody>
                    <!-- 비동기식 통신을 통해서 tbody를 채워라 -->
                </tbody>
            </table>
        </article>
    </div>

    <script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
    <script>
        $(function(){
            $("#btn").bind("click",function(){
                //버튼을 클릭할 때마다 수행하는 곳.
    
                // 서버에 비동기식 통신을 보낸다.
                $.ajax({
                    url: "Ex2_Ajax.jsp",    // 호츨하고자하는 URL 경로
                    type: "POST",              // 요청 방법(GET/POST)
                    data:   "count="+encodeURIComponent($("#numIn").val())+
                            "&test="+encodeURIComponent("test"),   // 인자 전달
                }).done(function(res){      // 서버로부터 전달되어오는 결과를
                                            // 인자로 받는다.
                    $("#t1>tbody").html(res);
    
                });
            });

            
            $("#numUp").bind("click",function(){
                upDown(+1);
            });
            $("#numDown").bind("click",function(){
                upDown(-1);
            });

            function upDown(n){
                let tmp = parseInt($("#numIn").val())+n;
                $("#numIn").val(tmp);
            }
        });
    </script>
    
</body>
</html>