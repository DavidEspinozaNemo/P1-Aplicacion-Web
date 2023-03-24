<%-- 
    Document   : newjsp
    Created on : 23 mar 2023, 19:34:38
    Author     : keylo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">


</head>
<body>
    <header>

        <h2> Modificando provedor </h2>

        <br>

        <form action="SvModificarProvedor" method="POST">
            <div class="form-group col-md-6">
              <label for="text">Nuevo nombre: </label>
              <input type="text" name="nombre" class="form-control" id="nombre" placeholder="Martin">
              <label for="number">Id del Provedor: </label>
                <input type="number" name="id" class="form-control" id="id" placeholder="00" maxlength="9">
            </div>
                <br>
                <button type="submit" class="btn btn-primary">Modificar</button>
    </header>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" crossorigin="anonymous"></script>

</body>
</html>
