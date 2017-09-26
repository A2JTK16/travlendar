/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package id.ac.polban.jtk.project3.travlendar2A.model;


import java.text.ParseException;
import java.util.ArrayList;
//import java.util.Calendar;
import java.util.Scanner;
import java.util.Date;
import java.util.List;
/**
 *
 * @author AGS
 */

public class ProgramUtama{
    
    /**
     * REVIEW
     * 1.   Great. 
     * 2.   Untuk Event, dapat ditambahkan array list karena satu traveller memiliki banyak event
     * 3.   Dapat ditampilkan rekomendasi kendaraan dari jarak kedua acara.
     *      Jika selisih waktu berangkat dari Event pertama dengan waktu tiba di Event kedua
     *      lebih besar daripada waktu yang harus ditempuh oleh semua moda transportasi,
     *      maka tampilkan saran kendaraan tersebut.
     *      Note : hal ini dapat dibuat class baru
     * 
     */
    
    protected Location locationEvent;
    protected DistanceMatrix distance;
    protected EstimationTime esTime;
    protected TransportationMode transport;
    protected Event event;
    protected ParseDate parsedt;
    protected Traveller traveller;
    
    public ProgramUtama(Event event, TransportationMode transport, Location locationEvent, DistanceMatrix distance, EstimationTime esTime){
        this.event = event;
        this.transport = transport;
        this.locationEvent = locationEvent;
        this.distance = distance;
        this.esTime = esTime;
    }
    
    public static void main(String[] args) throws ParseException{
        //ProgramUtama objMain = new ProgramUtama();
        //Event event = new Event();
        Event event = new Event();
        Location locationEvent = new Location();
        DistanceMatrix distance = new DistanceMatrix();
        EstimationTime esTime = new EstimationTime();
        TransportationMode transport = new TransportationMode();
        ParseDate parsedt = new ParseDate();
        Date arrivalTime = null;
        Date departureTime = null; 
        int transportation;
        int option = 1;
        int id, kodelokasi, kodekotaawal, kodekotatujuan;
        double speed=0;
        String fullname, username, email, password, eventName, tanggalStr, waktuStr, lokasi, kotaawal = null, kotatujuan = null;
        Scanner n = new Scanner(System.in);
        double diff = 0, diffSeconds = 0, diffMinutes = 0, diffHours = 0;
       // ArrayList<ProgramUtama> eventList = new ArrayList();
        List<String> list = new ArrayList<String>();
        
        //--------------------Input Data Traveller (Name, username, pass,....)--------------------------------------//
        System.out.println("Masukkan Nama Lengkap Anda : ");
        fullname = n.nextLine();
        
        System.out.println("Masukkan Username Anda : ");
        username = n.nextLine();
        
        System.out.println("Masukkan email Anda : ");
        email = n.nextLine();
        
        System.out.println("Masukkan password Anda : ");
        password = n.nextLine();
        Traveller traveller = new Traveller(fullname, username, email, password); 
        //-------------------------------------------------------------------------------------------------------------//
        
        do{
            System.out.println("\n1. Input Data\n2. Menampilkan Data\n3. Keluar : ");
            System.out.println("Masukkan Pilihan Anda : ");
            option = n.nextInt(); n.nextLine();
            switch(option){
   
                case 1 : //memasukkan event dan segala atributnya
                    //------------Input Data Event(Nama event, waktu berangkat, waktu tiba)-----------------------------------//
                    System.out.println("Nama Event : ");
                    eventName = n.nextLine();
                    event.setNama_event(eventName);
                    
                    do{
                        System.out.println("Masukkan Tanggal Tiba\nDate (Format dd-mm-yyyy) : ");
                    } 
                    while(!parsedt.setDateValue(n.next())); 
            
                    do{
                        System.out.println("Time (Format hh.mm.ss)");
                    } 
                    while(!parsedt.setTimeValStr(n.next()));
                    event.setArrivalTime(parsedt.getDateValue());
                    
                    do{
                        System.out.println("Masukkan Tanggal Berangkat\nDate (Format dd-mm-yyyy) : ");
                    } 
                    while(!parsedt.setDateValue(n.next())); 
            
                    do{
                        System.out.println("Time (Format hh.mm.ss)");
                    } 
                    while(!parsedt.setTimeValStr(n.next()));
                    event.setDepatureTime(parsedt.getDateValue());
                    
                    arrivalTime = event.getArrivaltime();
                    departureTime = event.getDeparturetime();
                    
                    diff = arrivalTime.getTime() - departureTime.getTime(); //untuk menghitung selisih jam
                    diffSeconds = diff / 1000 % 60; //selisih jam 
                    diffMinutes = diff / (60 * 1000) % 60; //selisih menit
                    diffHours = -1*(diff / (60 * 60 * 1000)); //selisih detik
                    //------------------------------------m-------------------------------------------------------------------------//
                    
                    
      
                    
                    //------------Input Data Lokasi(Kode lokasi, nama lokasi(Bandara Husen, Rumah Anu,...)------------------//
                    /*System.out.println("Masukkanmm Kode Lokasi Event : ");
                    kodelokasi = n.nextInt(); n.nextLine();
                    locationEvent.setKode_lokasi(kodelokasi);
                    
                    System.out.println("Masukkan Nama Lokasi Anda (Rumah, Bandara,...) : ");
                    lokasi = n.nextLine();
                    locationEvent.setNama_lokasi(lokasi);*/
                    //-------------------------------------------------------------------------------------------------------//
                  
                    System.out.println("1. Bandung \n2. Bekasi\n3. Bogor \n4. Ciamis\n5. Cianjur\n6. Cirebon\n7. Garut\n8. Indramayu\n9. Karawang\n10. Kuningan\n11. Majalengka\n12. Pangandaran\n13. Purwakarta\n14. Subang\n15. Sukabumi\n16. Sumedang\n17. Tasikmalaya\n");
                    System.out.println("Masukkan Kode Kota Awal Anda (1-17) : ");
                    kodekotaawal = n.nextInt();
                    switch(kodekotaawal) {
                        case 1 :
                            kotaawal = "Bandung";
                            
                            break;
                        case 2 :
                            kotaawal = "Bekasi";
                            
                            break;
                        case 3 :
                            kotaawal = "Bogor";
                            
                            break;
                        case 4 :
                            kotaawal = "Ciamis";
                            
                            break;
                        case 5 :
                            kotaawal = "Cianjur";
                            
                            break;
                        case 6 :
                            kotaawal = "Cirebon";
                            
                            break;
                        case 7 :
                            kotaawal = "Garut";
                            
                            break;
                        case 8 :
                            kotaawal = "Indramayu";
                            
                            break;
                        case 9 :
                            kotaawal = "Karawang";
                            
                            break;
                        case 10 :
                            kotaawal = "Kuningan";
                            
                            break;    
                        case 11 :
                            kotaawal = "Majalengka";
                            
                            break;
                        case 12 :
                            kotaawal = "Pangandaran";
                            
                            break;    
                        case 13 :
                            kotaawal = "Purwakarta";
                            
                            break;
                        case 14 :
                            kotaawal = "Subang";
                            
                            break;
                        case 15 :
                            kotaawal = "Sukabumi";
                            
                            break;    
                        case 16 :
                            kotaawal = "Sumedang";
                            
                            break;    
                        case 17 :
                            kotaawal = "Tasikmalaya";
                            
                            break;                                
                    }

                    System.out.println("1. Bandung \n2. Bekasi\n3. Bogor \n4. Ciamis\n5. Cianjur\n6. Cirebon\n7. Garut\n8. Indramayu\n9. Karawang\n10. Kuningan\n11. Majalengka\n12. Pangandaran\n13. Purwakarta\n14. Subang\n15. Sukabumi\n16. Sumedang\n17. Tasikmalaya\n");
                    System.out.println("Masukkan Kode Kota Tujuan Anda (1-17) : ");
                    kodekotatujuan = n.nextInt();
                    switch(kodekotatujuan) {
                        case 1 :
                            kotatujuan = "Bandung";
                            
                            break;
                        case 2 :
                            kotatujuan = "Bekasi";
                            
                            break;
                        case 3 :
                            kotatujuan = "Bogor";
                            
                            break;
                        case 4 :
                            kotatujuan = "Ciamis";
                            
                            break;
                        case 5 :
                            kotatujuan = "Cianjur";
                            
                            break;
                        case 6 :
                            kotatujuan = "Cirebon";
                            
                            break;
                        case 7 :
                            kotatujuan = "Garut";
                            
                            break;
                        case 8 :
                            kotatujuan = "Indramayu";
                            
                            break;
                        case 9 :
                            kotatujuan = "Karawang";
                            
                            break;
                        case 10 :
                            kotatujuan = "Kuningan";
                            
                            break;    
                        case 11 :
                            kotatujuan = "Majalengka";
                            
                            break;
                        case 12 :
                            kotatujuan = "Pangandaran";
                            
                            break;    
                        case 13 :
                            kotatujuan = "Purwakarta";
                            
                            break;
                        case 14 :
                            kotatujuan = "Subang";
                            
                            break;
                        case 15 :
                            kotatujuan = "Sukabumi";
                            
                            break;    
                        case 16 :
                            kotatujuan = "Sumedang";
                            
                            break;    
                        case 17 :
                            kotatujuan = "Tasikmalaya";
                            
                            break;                                
                    }
                    distance.cek_kota(kotaawal, kotatujuan);
                    double jarak = distance.getdistance();
                    esTime.transportRecomendation(jarak, (long) diffHours);
                    System.out.println("masukan transportasi yang akan dipilih");
                    String transportasi = n.next();
                   // ProgramUtama objMain = new ProgramUtama(event.getEvent(), transport, locationEvent, distance, esTime);
                    //eventList.add(objMain);
                    list.add(traveller.getFullname());
                    list.add(event.getEvent());
                    list.add(transportasi);
                    break;
                case 2 :
                   for (String s : list) {
                        System.out.println(s);
                        }
                    break;           
            }
        }while(option != 3);
    }
}