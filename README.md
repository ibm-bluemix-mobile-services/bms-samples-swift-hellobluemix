# HelloBluemix Swift Sample for Bluemix Mobile Services
---
This HelloBluemix sample contains Swift project that you can use to get started with Bluemix Mobile Services.
 
### Before you begin

Before you start, make sure you have a [Bluemix](http://bluemix.net) account.

### Configure the mobile backend for your HelloBluemix application

HelloBluemix application connects to a backend app hosted on Bluemix. The following procedure shows you how to create a backend app on Bluemix using the MobileFirst Services Starter. When you use the MobileFirst Services Starter a Node.js runtime environment is created so that you can provide server-side functions, such as resource URIs and static files. Once Node.js runtime is created the new instances of Mobile Client Access, IBM Push Notifications and Cloudant NoSQL DB are provisioned and bound to that Node.js runtime. 

To create a new backend app in the Bluemix dashboard:

1.	In the Boilerplates section of the Bluemix catalog, click MobileFirst Services Starter.
2.	Enter a name and host for your mobile backend and click Create.
3.	Click **Finish**
4.	Once MobileFirst Services Starter provisioning is complete take a note of the application route and application GUID in the Mobile Options section of your Bluemix app Dashboard. You will need them in following steps. 

### Running the HelloBluemix sample application

1. Clone the sample from Github with the following command:

```git clone https://github.com/ibm-bluemix-mobile-services/bms-samples-swift-hellobluemix.git```

1. In a terminal navigate to the `bms-samples-swift-hellobluemix` directory where the project was cloned
2. Make sure you have Cocoapods installed by running `pod --version`. If you don't have Cocoapods installed you can get it from [https://cocoapods.org](https://cocoapods.org)
2. Run `pod install` to install required Cocoapods dependencies
3. Open the Xcode workspace with following command `open HelloBluemix.xcworkspace`.
4. Open the **AppDelegate.swift** and update **appRoute** and **appGuid** values to the ones obtained in previous steps. 
5. If required change the value of **bluemixRegion** to the region you're using.

> IMPORTANT. Make sure that your appRoute is using **https** protocol and not **http**. Otherwise you might get a connection failure due to Apple's Application Transport Security settings. You can read more about it here - [Connect Your iOS 9 App to Bluemix](https://developer.ibm.com/bluemix/2015/09/16/connect-your-ios-9-app-to-bluemix/)

		
### Run the iOS App

Now you can run your Swift application in your mobile emulator or on your device.

You will see a single view application with a "PING BLUEMIX" button. When you click this button the application will test the connection from the client to the backend Bluemix application. The application uses the **appRoute** specified in the **AppDelegate.swift** in order to test the connection. The application will then display if the connection was successful or unsuccessful. In the unsuccessful state an error will be displayed in the log as well as in the application. 

### License
This package contains sample code provided in source code form. The samples are licensed under the under the Apache License, Version 2.0 (the "License"). You may obtain a copy of the License at http://www.apache.org/licenses/LICENSE-2.0 and may also view the license in the LICENSE file within this package. Also see the notices.txt file within this package for additional notices.
