<%@ include file="header.jsp" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Buy an Item</title>
    <style>
        body {
            background-color: black;
            color: white;
            font-family:'Trebuchet MS';
            margin: 0;
            padding-top: 100px; /* Add padding to the top to make space for the navbar */
        }
        h1 {
            color: rgb(245, 163, 62);
            text-align: center;
        }
        .category {
            display: block;
            margin: 10px 0;
            padding: 10px;
            color: white;
            background-color: rgb(59, 60, 54);
            text-decoration: none;
            border-radius: 5px;
            text-align: center;
            transition: background-color 0.3s ease;
        }
        .category:hover {
            background-color: rgb(245, 163, 62);
            color: black;
        }
        .container {
            max-width: 600px;
            margin: 20px auto;
            padding: 20px;
            border: 1px solid #FFD700;
            border-radius: 10px;
            background-color: rgb(30, 30, 30);
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
        <h1>Select a Category to Buy</h1>
        <a class="category" href="buy/All.jsp">All</a><br>
        <a class="category" href="buy/houses.jsp">Houses</a><br>
        <a class="category" href="buy/furniture.jsp">Furniture</a><br>
        <a class="category" href="buy/electronics.jsp">Electronics</a><br>
        <a class="category" href="buy/appliances.jsp">Home Appliances</a><br>
        <a class="category" href="buy/books.jsp">Books</a><br>
        <a class="category" href="buy/clothing.jsp">Clothing and Footwear</a><br>
        <a class="category" href="buy/sports.jsp">Sports</a><br>
        <a class="category" href="buy/others.jsp">Others</a><br>
    </div>
</body>
</html>
