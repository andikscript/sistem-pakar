/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package contact;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.MalformedURLException;
import java.net.URL;
import java.io.File;
import java.io.IOException;

/**
 *
 * @author genz
 */
public class Location {
    public String ip;
    
    public void cekIpPublic() throws MalformedURLException, IOException{
        URL url = new URL("http://checkip.amazonaws.com");
        BufferedReader a = new BufferedReader(new InputStreamReader(url.openStream()));
        String ip = a.readLine();
        this.ip = ip;
    }
}
