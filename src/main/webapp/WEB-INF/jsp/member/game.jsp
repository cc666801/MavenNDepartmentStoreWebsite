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
                                        <div id="result"><H3>恭喜抽中:?點</H3></div>
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
    var playButton = document.getElementById("playButton");
    var isButtonClickable = true;

    playButton.addEventListener("click", function() {
        if (isButtonClickable) {
            isButtonClickable = false;
            fetch("${contextRoot}/game/play", { method: "POST" })
                .then(response => response.json())
                .then(data => {
                    simulateDrawing(data.point, data.totalPoints);
                })
                .catch(error => console.log(error));
            
            setTimeout(function() {
                isButtonClickable = true;
            }, 3000);
        }
    });

    function simulateDrawing(point, totalPoints) {
        const resultElement = document.getElementById("result");
        const pointsElement = document.getElementById("points");

        let currentPoint = 1;
        let interval = setInterval(() => {
            resultElement.innerHTML = "<h3>抽取中: " + currentPoint + "點</h3>";
            currentPoint = currentPoint % 8 + 1;
        }, 30);

        setTimeout(() => {
            clearInterval(interval);
            resultElement.innerHTML = "<h3>恭喜抽中: " + point + "點</h3>";
            pointsElement.innerText = "目前擁有: " + totalPoints + "點";
        }, 3000);
    }
</script>

</body>
</html>