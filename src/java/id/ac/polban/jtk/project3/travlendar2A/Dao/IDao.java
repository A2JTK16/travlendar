/*  
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package id.ac.polban.jtk.project3.travlendar2A.Dao;

import java.util.List;

/**
 *
 * @author mufidjamaluddin
 * @param <T>
 */
public interface IDao<T>
{
    /**
     * Mendapatkan list dari database
     * berdasarkan parameter
     * @param paramName
     * @param paramValue
     * @return 
     */
    public List<T> getList(String paramName, String paramValue);
    
    /**
     * Mendapatkan data dalam object dari database berdasarkan paramName
     * @param paramName
     * @param paramValue
     * @return 
     */
    
    public T getObj(String paramName, String paramValue);
    
    /**
     *   Menyimpan data ke database
     *   Mengembalikan nilai PK yang auto increment
     *   Jika tidak memiliki PK yang auto increment, maka mengembalikan 1 jika sukses insert
     *   SQL : INSERT INTO class-name ( class-attribute ) VALUES ( attribute-value-from-object )
     * 
     * @param object 
     * @return  
     */
    public int create(Object object);
    
    /**
     *   Menyunting data ke database
     *   Mengembalikan jumlah rows yang terdampak
     *   Mengembalikan nol jika gagal update atau parameter null
     *   SQL : UPDATE class-name SET ( attribute-name = attribute-value-from-object )
     * 
     * @param object
     * @param whereObj
     * @return  
     */
    public int edit(Object object, Object whereObj);
    
    /**
     *  Menghapus data database berdasarkan paramName
     *  Mengembalikan jumlah rows yang terhapus
     *  Mengembalikan nol jika gagal update atau parameter null
     *  SQL : DELETE FROM class-name WHERE ( paramName = paramValue )
     *
     * @param object
     * @return  
     */
    public int delete(Object object);
    
    /**
     *  Method untuk Mengeksekusi Fungsi PL SQL
     *  SQL : SELECT funcName ( paramFunc )
     * 
     * @param <TR> sebagai tipe kembalian
     * @param funcName nama fungsi
     * @param typeReturn instant class
     * @param paramFunc parameter fungsi
     * @return 
     */
    public <TR> TR executeFunction(String funcName, Class<TR> typeReturn, String... paramFunc);
}