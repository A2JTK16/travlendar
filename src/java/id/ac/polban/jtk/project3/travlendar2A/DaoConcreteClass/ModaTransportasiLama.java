/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package id.ac.polban.jtk.project3.travlendar2A.DaoConcreteClass;

import id.ac.polban.jtk.project3.travlendar2A.DaoConcreteClass.DAO;
import id.ac.polban.jtk.project3.travlendar2A.Models.ModaTransportasi;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Reza Dwi Kurniawan
 */
    public class ModaTransportasiLama extends DAO {
        public ModaTransportasiLama (String jdbcURL, String jdbcUsername, String jdbcPassword){
            super(jdbcURL, jdbcUsername, jdbcPassword);
        }
    
    public List<ModaTransportasi> getDataFromDB() throws SQLException {
        List <ModaTransportasi> listData;
        listData = new ArrayList();
        ModaTransportasi modaTrans;
        
        String sql = "SELECT * FROM `transportation_mode`";
        super.connect();
        
        Statement stmt;
        ResultSet rs;
        
        stmt = super.getJdbcConnection().createStatement();
        rs = stmt.executeQuery(sql);
        
        while(rs.next()){
            modaTrans = new ModaTransportasi();
            
            modaTrans.setKecepatan(rs.getFloat("TRANSPORTATION_SPEED"));
            modaTrans.setKodeTransportasi(rs.getString("TRANSPORTATION_CODE"));
            modaTrans.setNamaTransportasi(rs.getString("TRANSPORTATION_NAME"));
            
            listData.add(modaTrans);
        }
        
        stmt.close();
        super.disconnect();
        
        return listData;
    }   
    
        /**
     * Menyimpan data ke database
     * @param modaTrs
     * @throws SQLException 
     */
    public void saveDataToDB(ModaTransportasi modaTrs) throws SQLException
    {
        String sql = String.format("INSERT INTO `transportation_mode`(`TRANSPORTATION_CODE`, `TRANSPORTATION_NAME`, `TRANSPORTATION_SPEED`) VALUES ('%s','%s','%s')", modaTrs.getKodeTransportasi(),modaTrs.getNamaTransportasi(), modaTrs.getKecepatan() );
        /**
         * Buat Koneksi ke DBMS
         */
        super.connect();
        /**
         * Buat Statement
         */
        Statement statement;
        statement = super.getJdbcConnection().createStatement();
        /**
         * Eksekusi Query
         */
        
        statement.executeUpdate(sql);
        /**
         * Tutup Statement
         */
        statement.close();
        /**
         * Tutup Koneksi
         */
        super.disconnect();
    }
}