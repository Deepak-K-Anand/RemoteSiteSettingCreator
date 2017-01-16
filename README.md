#RemoteSiteSettingCreator
Create a Remote Site Setting for the Salesforce API automatically if absent using the Metadata API.

##Problem
At times, we might end up in a situation wherein we need to make calls to the Salesforce API itself such as it's REST API or so. One such example could be accessing the ListView API. In such instances, one would have to add the Endpoint URL to the Salesforce API as a Remote Site Setting in order to make calls to this endpoint from within Apex. That being said, it get's even more complicated if we have to ship this as an AppExchange App since endpoints to the Salesforce Org itself is going to vary from customer to customer.

##Solution(s)
So we have two solutions to this problem:

*   **Using the Metadata API from Apex**. The idea is to use the Metadata API from Apex to create the Remote Site Setting. In order to do that, you will have to use the popular - [apex_mdapi](https://github.com/financialforcedev/apex-mdap]). You could then possibly invoke the same from the PostInstallClass.

*   **Using the Metadata API from JS**. Instead of using Apex, we would spawn the Metadata API from JavaScript. You will create a *Visualforce Component* that lies on that VF Page that might want to make calls to the Salesforce API. The calls to Salesforce Metadata API from JavaScript will be done via the excellent [jsforce](https://jsforce.github.io/) library.

##Usage
In order to use this VF Component, all you have to do is to just include the Component on the VF page:

```html
<apex:page>
    <c:RemoteSiteSettingCreator />
</apex:page>
```
The Component generates a JS Object called ```RemoteSiteSettingCreator``` on the Window object. It exposes a flag - ```RemoteSiteSettingCreator.constants.remoteSiteSettingCreated``` that can be later utilized in the application life cycle to determine if the setting was created or not.

Also, the Component has an optional ```callback``` attribute that can accept JS code as a string literal and the same will be evaluated after the setting has been created successfully.

```html
<apex:page>
    <c:RemoteSiteSettingCreator callback="alert( 'Done!' );" />
</apex:page>
```

##Note
The component already has code that will automatically perform a check if the endpoint has been added previously or not. If there exists one then it will not add a duplicate entry in the Remote Site Settings.

##Deployment
Use the below button to deploy this to your SF Org in a single click!
<br/><a href="https://githubsfdeploy.herokuapp.com?owner=Deepak-K-Anand&repo=RemoteSiteSettingCreator">
  <img alt="Deploy to Salesforce"
       src="https://raw.githubusercontent.com/afawcett/githubsfdeploy/master/src/main/webapp/resources/img/deploy.png">
</a>

##Licensing
Completely free! Use it at your own will.
