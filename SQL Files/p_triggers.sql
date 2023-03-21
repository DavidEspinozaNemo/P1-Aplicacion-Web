--Triggers
    
create or replace trigger tr_actualizar_precio
  before update of precio
  on producto
  for each row
 begin
  insert into BITACORA_PRODUCTO values(1, :old.NOMBRE, :old.PRECIO, :new.PRECIO, sysdate);
 end tr_actualizar_precio;
 /


create or replace trigger tr_actualizar_salario
  before update of SALARIO
  on EMPLEADO
  for each row
 begin
  insert into BITACORA_SALARIOS(FECHA_CAMBIO, USUARIO, EMPLEADO, SALARIO_ANTERIOR, SALARIO_NUEVO) 
  values(sysdate, user, :old.ID, :old.SALARIO, :new.SALARIO);
 end tr_actualizar_salario;
 /
