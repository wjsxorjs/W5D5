<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Ex3_Index</title>
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
            <button type="button" id="btn">목록</button>

            <table id="t1">
                <caption>사원목록 테이블</caption>
                <thead>
                    <tr>
                        <th>번호</th>
                        <th>사번</th>
                        <th>이름</th>
                        <th>직종</th>
                        <th>입사일</th>
                        <th>부서코드</th>
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
                    url:"Ex3_Ajax.jsp",
                    type:"get",
                    data:"",
                }).done(function(res){
                    $("#t1>tbody").html(res);
                });
            });

            
        });
    </script>
    
</body>
</html>