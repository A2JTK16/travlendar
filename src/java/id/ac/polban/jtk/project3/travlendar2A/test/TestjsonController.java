/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package id.ac.polban.jtk.project3.travlendar2A.test;

import com.fasterxml.jackson.databind.ObjectMapper;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author mufidjamaluddin
 */
@WebServlet(name = "json", urlPatterns = {"/json"}) /* URL Controllernya */
public class TestjsonController extends HttpServlet
{
    private LocationDaoImp locDaoObj;
    private ObjectMapper jsonMapper;
    
    @Override
    public void init()
    {
        this.locDaoObj = new LocationDaoImp("jdbc:mysql://localhost:3306/travlendar2Anew","root","");
        this.jsonMapper = new ObjectMapper();
    }
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    {
        List<Location> list;
        
        try { // AMBIL DATA DARI DATABASE
            list = this.locDaoObj.getListFromDB(1);
        } catch (SQLException ex) {
            list = null;
        }

        try 
        {
            String jsonStr = jsonMapper.writeValueAsString(list);
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            response.getWriter().write(jsonStr);
        } 
        catch (IOException ex) 
        {
            Logger.getLogger(TestjsonController.class.getName()).log(Level.SEVERE, null, ex);
        }

    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    {
        Location objLoc = new Location();
        
        objLoc.setLat(request.getParameter("latitude"));
        objLoc.setLng(request.getParameter("longitude"));
        objLoc.setDesc(request.getParameter("desc"));
        
        try 
        {
            this.locDaoObj.saveDataToDB(objLoc);
            response.setContentType("text/html");
            response.setCharacterEncoding("UTF-8");
            response.getWriter().write("Input Data Sukses!");
        } 
        catch (SQLException | IOException ex) 
        {
            Logger.getLogger(TestjsonController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
}
