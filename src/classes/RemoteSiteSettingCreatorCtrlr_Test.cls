/**
 * Apex Unit Test for the Apex Class - 
 * RemoteSiteSettingCreatorCtrlr.
 */
@isTest
public class RemoteSiteSettingCreatorCtrlr_Test {
    testMethod
    static void sfdcURL_Test() {
        Test.startTest();
        
            RemoteSiteSettingCreatorCtrlr ctrlr = new RemoteSiteSettingCreatorCtrlr();
            
            String sfdcURL = ctrlr.sfdcURL;
            
        Test.stopTest();
        
        System.assertEquals( TRUE, sfdcURL != NULL );
    }
    
    testMethod
    static void isSFDCRegistered_Test() {
        Test.startTest();
        
            RemoteSiteSettingCreatorCtrlr ctrlr = new RemoteSiteSettingCreatorCtrlr();
            
            Boolean isSFDCRegistered = ctrlr.isSFDCRegistered;
            
        Test.stopTest();
        
        System.assertEquals( TRUE, isSFDCRegistered );
    }
}