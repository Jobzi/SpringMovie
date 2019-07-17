/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package WebService;

import Model.DAO.SocioDAO;
import Model.POJO.Socio;
import javax.jws.WebService;
import javax.jws.WebMethod;
import javax.jws.WebParam;

/**
 *
 * @author KryzAle
 */
@WebService(serviceName = "RegistrarSocio")
public class RegistrarSocio {

    /**
     * Web service operation
     */
    @WebMethod(operationName = "registrame")
    public String registrame(@WebParam(name = "cedula") String cedula, @WebParam(name = "nombre") String nombre, @WebParam(name = "direccion") String direccion, @WebParam(name = "telefono") String telefono, @WebParam(name = "correo") String correo) {
        SocioDAO nuevoSocio = new SocioDAO();
        
        return nuevoSocio.guardarSocio(new Socio(cedula,nombre,direccion,telefono,correo));
    }
}
