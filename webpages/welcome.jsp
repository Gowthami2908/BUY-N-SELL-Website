<%@ include file="header.jsp" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Welcome</title>
    <style>
        body {
            font-family: 'Trebuchet MS';
            background-color: #121212;
            color: rgb(245, 163, 62);
            display: flex;
            flex-direction: column;
            align-items: center;
            height: 100vh;
            margin: 0;
            font-size: 20px;
            padding-top:100px;
        }
        .container {
            text-align: center;
            margin-top: 50px;
        }
        .container h2 {
            font-family: Segoe Script;
            margin: 20px 0;
        }
        .actions {
            display: flex;
            justify-content: space-between;
            width: 50%;
            margin: auto;
        }
        .actions div {
            background-color: rgb(245, 163, 62);
            color: #000;
            padding: 20px;
            border-radius: 10px;
            cursor: pointer;
            width: 400px;
            text-align: center;
            margin: 10px;
            
        }
        .actions div:hover {
            background-color: #E6BE8A;
        }
        .nav {
            width: 100%;
            padding: 35px 0;
            margin: auto;
            align-items: end;
            display: flex;
            justify-content: space-between;
            background-image: linear-gradient(to bottom right, rgb(224, 156, 72), rgb(224, 156, 72));
            position: fixed;
            top: 0;
            z-index: 1000;
            height: 10px;
        }
        .nav ul li {
            list-style: none;
            display: inline-block;
            margin: -15px 15px;
            position: relative;
            margin-right: 40px;
        }
        .nav ul li a {
            text-decoration: none;
            text-shadow: black;
            font-size: 22px;
            font-family: 'Segoe Script', sans-serif;
            font-weight: bolder;
            color: black;
            text-transform: uppercase;
        }
        .nav ul li::after {
            content: '';
            height: 3px;
            width: 0;
            background-color: rgb(255, 255, 255);
            position: absolute;
            left: 0;
            bottom: -3px;
            transition: 0.5s;
        }
        .nav ul li:hover::after {
            width: 100%;
        }
        .nav ul {
            margin-top: 70px;
            margin-right: 80px;
            margin-bottom: -10px;
        }
    </style>
</head>
<body>
    <div class="nav">
        <h1 style="font-size: 40px; color: black; font-family: 'Segoe Script', sans-serif; margin-bottom: -30px; margin-left: 10px;">Buy N Sell</h1>
        <ul>
            <li><a href="index.html">Home</a></li>
            <li><a href="buy.jsp">Buy</a></li>
            <li><a href="sell.jsp">Sell</a></li>
            <li><a href="cart.jsp">Cart</a></li>
            <li><a href="#">Contact</a></li>
        </ul>
    </div>
    <div class="container">
        <h2 style="font-size: 40px">Welcome, <%= session.getAttribute("username") %>!</h2>
        <p>Thank you for signing in! You can find exciting products to BUY and even SELL any product here.</p>
        <div class="actions">
            <div onclick="location.href='buy.jsp'">
                <h2>BUY</h2>
                <p>You can buy products or items of different categories from here</p>
            </div>
            <div onclick="location.href='sell.jsp'">
                <h2>SELL</h2>
                <p>You can sell products or items of wide varieties here.</p>
            </div>
        </div>
    </div>
</body>
</html>
