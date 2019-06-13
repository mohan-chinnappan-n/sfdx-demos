public with sharing class AccountCtrl {
    public AccountCtrl() {
     
    }
    
    @AuraEnabled
    public static List<account> findAll() {
        return [SELECT Id, Name, GreenProjectInUse__c 
                FROM Account
                LIMIT 50
               ];
    }
    
}