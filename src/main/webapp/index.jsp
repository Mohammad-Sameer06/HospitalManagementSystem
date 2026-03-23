<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Hospital Login</title>
    <style>
        body { font-family: Arial, sans-serif; text-align: center; margin-top: 100px; }
        .login-box { border: 1px solid #ccc; padding: 20px; width: 300px; margin: 0 auto; border-radius: 10px; }
        input { width: 90%; padding: 10px; margin: 10px 0; }
        button { padding: 10px 20px; background-color: #007BFF; color: white; border: none; cursor: pointer; }
    </style>
</head>
<body>

<div class="login-box">
    <h2>Hospital Login</h2>

    <form action="login" method="post">
        <input type="text" name="username" placeholder="Username" required><br>
        <input type="password" name="password" placeholder="Password" required><br>
        <button type="submit">Login</button>
    </form>

    <p style="color:red;">${errorMessage}</p>
</div>

</body>
</html>