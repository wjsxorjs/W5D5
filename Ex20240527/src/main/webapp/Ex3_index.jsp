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
            <div>
                <select id="s_type">
                    <option value="0">::선택::</option>
                    <option value="1">사번</option>
                    <option value="2">이름</option>
                    <option value="3">직종</option>
                    <option value="4">부서번호</option>
                </select>
                <input type="text" id="s_value">
                <button type="button" id="s_btn">검색</button>


            </div>

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

            $("#s_btn").bind("click",function(){
                
                let s_type = $("#s_type").val();
                let s_value = $("#s_value").val();

                // 유효성검사
                s_value = clrSpace(s_value);

                if(s_value.length == 0 || s_type == 0){
                    s_type = -1;
                    s_value = 0;
                    $("#s_value").val("");
                }

                //전달할 파라미터 값 준비(s_type, s_value)
                let param = "s_type=" + encodeURIComponent(s_type) + "&s_value=" + encodeURIComponent(s_value);


                $.ajax({
                    url:"Ex3_Search.jsp",
                    type:"post",
                    data: param,
                }).done(function(res){
                    $("#t1>tbody").html(res);
                });
            });


            function clrSpace(str){
            return str.replace(/^\s+|\s+|\s+$/g,"");
        }
            
        });
    </script>
    
</body>
</html>