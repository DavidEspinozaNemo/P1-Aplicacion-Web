<%-- 
    Document   : agregarEmpleado
    Created on : 23 mar 2023, 15:01:39
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

        <h2> Agregando empleado </h2>

        <br>

        <form action="SvAgregarEmpleado" method="POST">

            <div class="form-group col-md-6">
                <label for="text">Nombre: </label>
                <input type="text" name = "nombre" class="form-control" id="nombre" placeholder="Nombre" maxlength="20">
              </div>

              <div class="form-group col-md-6">
                <label for="text">Apellido 1: </label>
                <input type="text" name = "apellido1" class="form-control" id="apellido1" placeholder="Primer Apellido" maxlength="20">
              </div>

              <div class="form-group col-md-6">
                <label for="text">Apellido 2: </label>
                <input type="text" name = "apellido2" class="form-control" id="apellido2" placeholder="Segundo Apellido" maxlength="20">
              </div>

              <div class="form-group col-md-6">
                <label for="number">Salario: </label>
                <input type="number" name = "salario" class="form-control" id="salario" placeholder="000000.00" maxlength="9">
              </div>
            

              <div class="form-row">
                <div class="form-group col-md-6">
                  <label for="date">Fecha de registro: </label>
                  <input type="date" name = "fecha" class="form-control" id="fecha">
                </div>

                <div class="form-group col-md-6">
                    <label for="email">Correo: </label>
                    <input type="email" name = "correo" class="form-control" id="correo" placeholder="ejemplo@gmail.com">
                  </div>

                  <div class="form-group col-md-6">
                    <label for="email">Contacto: </label>
                    <input type="tel" name = "contacto" class="form-control" id="contacto" placeholder="7203-7777" maxlength="9">
                  </div>


            <button type="submit" class="btn btn-primary">Agregar</button>
          </form>
          <br>



    
    </header>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" crossorigin="anonymous"></script>

</body>
</html>