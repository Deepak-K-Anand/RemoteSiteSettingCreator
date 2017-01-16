/**
 * Apex Controller for the Visualforce
 * Component - RemoteSiteSettingCreator.
 * 
 * @author      Deepak K Anand
 * @since       16 Jan 2017
 * @revisions   N/A
 */
public class RemoteSiteSettingCreatorCtrlr {
    public String sfdcURL {
        get {
            return String.valueOf( URL.getSalesforceBaseUrl().toExternalForm() );
        }
    }
    
    public Boolean isSFDCRegistered {
        get {
            return checkSFDCRegistered();
        }
    }
    
    /**
     * Check if a Remote Site Setting for the 
     * Salesforce API has been created or
     * not. Returns a TRUE if a Setting has been
     * created already else a FALSE.
     */
    private Boolean checkSFDCRegistered() {
        try {
            /**
             * The check for an existing Remote
             * Site Setting for Salesforce is
             * determined by making a GET to the
             * SFDC API Endpoint and if an exception
             * is thrown then it signifies that the
             * setting hasn't been added and thus
             * returns a FALSE.
             */
            HttpRequest req = new HttpRequest();
            req.setEndpoint( sfdcURL );
            req.setMethod( 'GET' );
            
            if( !Test.isRunningTest() ) new Http().send( req );
            
            return TRUE;
        }
        catch( Exception ex ) { return FALSE; }
    }
}
