<%@ page language="java" contentType="text/html; charset=EUC-KR"
   pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
#main_center {
   margin: 0 20px;
   width: 760px;
   height: 480px;
   background: white;
}
</style>
<script>
   $(document).ready(function() {
      $('#d_bt').click(function() {
         var c = confirm('삭제 하시겠습니까?');
         if (c == true) {

            $('#user_information').attr({
               'method' : 'post',
               'action' : 'userdel.do'
            });
            $('#user_information').submit();
         }
         ;
      });
   });
   $(document).ready(function() {
      $('#m_bt').click(function() {
         var c = confirm('수정 하시겠습니까?');
         if (c == true) {

            $('#user_information').attr({
               'method' : 'post',
               'action' : 'usermod.do'
            });
            $('#user_information').submit();
         }
         ;
      });
   });
</script>
<div id="main_center">
   <h1>User Info Page</h1>
   <form id="user_information">
      ID<input type="text" name="id" id="id" value="${userinfo.id }"><br> 
      PWD<input type="text" name="pwd" id="pwd" value="${userinfo.pwd }"><br> 
      NAME<input type="text" name="name" id="name" value="${userinfo.name }"><br> 
      <input type="button" value="MODIFY" id="m_bt">
      <input type="button" value="DELETE" id="d_bt">
   </form>
</div>
