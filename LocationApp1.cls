public class LocationApp1 {
    @AuraEnabled(cacheable=true)
    public static list<location> getAccount() {
   

      list<Account> accs = [select id,name,billingstreet,billingcity,billingcountry
                                        from Account
                                         ];
        list<location> newLoc = new list<location>();
    // creattion d'un metadata-type dans la config , le champs name : clé  , champs custom : {value} 
    //dans la clé sera stocké : developer name du record type du compte , dans le champs value , on aura l'icone correspodante.
    //recupération du metedata-type et stockage dans un variable type maps (comme list ou set).
        for (Account acc:accs) {
            geolocation newGeo = new geolocation();
            newGeo.Street=acc.billingStreet;
            NewGeo.City=acc.BillingCity;
            newGeo.Country=acc.billingCountry;
    
            location newLocation = new Location();
            newLocation.icon='utility:salesforce1'; // mapsetting.get (acc.recordtype.developerName)
            newLocation.title=acc.Name;
            newLocation.description=acc.Name;
            newLocation.location=newGeo;
    
            newLoc.add(newLocation);
    
        }
    return newLoc;
     }

 public class geolocation{
    @AuraEnabled
    public string Street{get;set;}
    @AuraEnabled
    public string City{get;set;}
    @AuraEnabled
    public string Country{get;set;}
 }                                  

 public class location{ 
    @AuraEnabled
     public string icon {get;set;}
     @AuraEnabled
     public string title {get;set;}
     @AuraEnabled
     public string description{get;set;}
     @AuraEnabled
     public geolocation location{get;set;}
    
 }

 

    


 }




