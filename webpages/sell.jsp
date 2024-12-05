<%@ include file="header.jsp" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Sell Your Item</title>
    <style>
        body {
            font-family: 'Trebuchet MS', 'Lucida Sans Unicode', 'Lucida Grande', 'Lucida Sans', Arial, sans-serif;
            background-color: #121212;
            color: #FFFFFF;
            margin: 0;
            padding-top: 100px;
        }
        .container {
            display: flex;
            justify-content: space-between;
            padding: 20px;
        }
        .left-section, .right-section {
            width: 48%;
        }
        .left-section {
            background-color: black;
            padding: 20px;
            border-radius: 8px;
        }
        .right-section {
            background-color: black;
            padding: 20px;
            border-radius: 8px;
        }
        h1, h2 {
            color: rgb(224, 156, 72);
        }
        label {
            display: block;
            margin-top: 10px;
            color: rgb(224, 156, 72);
        }
        input[type="text"], input[type="email"], input[type="number"], textarea, select {
            width: 100%;
            padding: 10px;
            margin-top: 5px;
            margin-bottom: 20px;
            border: 1px solid rgb(224, 156, 72);
            border-radius: 4px;
            background-color: #333;
            color: #fff;
        }
        input[type="text"]:focus, input[type="email"]:focus, input[type="number"]:focus, textarea:focus, select:focus {
            border-color: rgb(245, 163, 62); 
            box-shadow: 0 0 10px rgb(245, 163, 62); 
            outline: none;
        } 
        button {
            background-color: rgb(224, 156, 72);
            color: #000;
            padding: 10px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }
        button:hover {
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
            height:10px;
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
        <div class="left-section">
            <h1 style="font-family: 'Segoe Script', sans-serif; font-size: 50px; margin-top: 100px;">Sell Your Item</h1>
            <p>Welcome, Here you can sell your items quickly and easily. Provide all the necessary details about the item and your contact information to start selling.</p>
            <p>Make sure to provide accurate information to attract more buyers. Happy selling!</p>
        </div>
        <div class="right-section">
            <h2>Item Details</h2>
            <form action="sell_action.jsp" method="post">
                <label for="itemname">Item Name</label>
                <input type="text" id="itemname" name="itemname" required>

                <label for="category">Category</label>
                <select id="category" name="category" required>
                    <option value="Select">Select Category of Item</option>
                    <option value="Houses">Houses</option>
                    <option value="Furniture">Furniture</option>
                    <option value="Electronics">Electronics</option>
                    <option value="Home Appliances">Home Appliances</option>
                    <option value="Clothing and Footwear">Clothing and Footwear</option>
                    <option value="Books">Books</option>
                    <option value="Sports">Sports</option>
                    <option value="Others">Others</option>
                </select>

                <label for="itemdesc">Item Description</label>
                <textarea id="itemdesc" name="itemdesc" rows="4" required></textarea>

                <label for="itemprice">Price</label>
                <input type="number" id="itemprice" name="itemprice" required>

                <h2>Seller Details</h2>
                <label for="username">Username</label>
                <input type="text" id="username" name="username" required>
                
                <label for="sellingid">Seller ID</label>
                <p style="color:red;">Note: Your seller id is a combination of the first 4 letters of your username and the last four numbers of your mobile number</p>
                <p style="color:red;">Example: username= john and mobile number =1234567890 then seller id= "john7890"</p>  
                <input type="text" id="sellingid" name="sellingid" required>

                <label for="email">Email</label>
                <input type="email" id="email" name="email" required>

                <label for="mobile">Mobile</label>
                <input type="number" id="mobile" name="mobile" required>

                <label for="address">Address</label>
                <textarea id="address" name="address" rows="2" required></textarea>

                <button type="submit">Add Product to Sell</button>
            </form>
        </div>
    </div>
</body>
</html>
