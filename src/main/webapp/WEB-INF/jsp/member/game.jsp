<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html lang="zh-TW">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>幸運抽獎</title>
    <!-- 添加所需的CSS樣式 -->
    <style>
        input[type="password"] {
            border: none;
            background-color: transparent;
            -webkit-box-shadow: none;
            -moz-box-shadow: none;
            box-shadow: none;
        }

        table {
            margin: auto;
        }

        .btn-custom {
            background-color: #4CAF50;
            color: white;
        }

        form {
            margin-top: 50px;
        }

        button[type="submit"] {
            background-color: #4CAF50;
            border: none;
            color: white;
            padding: 10px 20px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 16px;
            margin-top: 20px;
            cursor: pointer;
        }

        button[type="submit"]:hover {
            background-color: #3e8e41;
        }

        label {
            font-weight: bold;
            margin-right: 10px;
        }

        th {
            text-align: right;
            font-weight: bold;
        }

        h1 {
            text-align: center;
            color: #0a0a0a;
            margin-bottom: 30px;
        }

        .btn-link {
            color: #4CAF50;
            text-decoration: none;
            border: none;
            background-color: transparent;
            font-size: 16px;
            padding: 0;
            margin-right: 20px;
        }

        .btn-link:hover {
            color: #3e8e41;
        }
    </style>
</head>
<body>
    <jsp:include page="../layout/header.jsp"></jsp:include>
    <main id="main" class="container">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-md-8 col-lg-6">
                    <div class="card">
                        <div class="card-body">
                            <table class="table">
                                <tr>
                                    <td colspan="2">
                                        <h1>幸運抽獎</h1>
                                        <h2 id="points">目前擁有: ${member.points}點</h2>
                                        <div id="result"></div>
                                        <button type="submit" id="playButton" class="btn btn-primary btn-block">抽取點數</button>
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </main>
    
        <!-- 添加所需的JavaScript -->
    <script>
    document.addEventListener("DOMContentLoaded", function() {
        const playButton = document.getElementById("playButton");
        playButton.addEventListener("click", function() {
            const lastClickedDate = localStorage.getItem("lastClickedDate");
            const currentDate = new Date().toISOString().split("T")[0];

            if (lastClickedDate === currentDate) {
                alert("今天已經抽過了！");
                return;
            }

            fetch("${contextRoot}/game/play", { method: "POST" })
                .then(response => response.json())
                .then(data => {
                    showResult(data.point, data.totalPoints);
                    updatePoints(data.totalPoints);
                    localStorage.setItem("lastClickedDate", currentDate);
                })
                .catch(error => console.log(error));
        });

        function showResult(point, totalPoints) {
            const resultElement = document.getElementById("result");
            resultElement.innerText = "恭喜抽中: " + point + "點";
            resultElement.style.display = "block";
        }

        function updatePoints(totalPoints) {
            const pointsElement = document.getElementById("points");
            pointsElement.innerText = "目前擁有: " + totalPoints + "點";
        }
    });

    </script>
</body>
</html>

