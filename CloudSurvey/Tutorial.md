<a name="title" />
# Web Sites - CloudSurvey#

---

<a name="Overview" />
## Overview ##

This demonstration shows how to ...

> **Note:** In order to run through this complete demo, you must have network connectivity and a Microsoft account.

<a id="goals" />
### Goals ###
In this tutorial you will see ho to:

1.	...

<a name="technologies" />
### Key Technologies ###

This demo uses the following technologies:

- [Windows Azure Management Portal] [1]

[1]: https://manage.windowsazure.com/

<a name="setup" />
### Setup and Configuration ###

To run the demo, you need to have configured a SQL Database in Azure and install and configure the Azure Command-Line tools.

1. Run the **Setup.cmd** script located at the **\Source** folder to create the database required for the CloudSurvey solution.

1. Open a Command Prompt with administrator privileges and execute the following command to download your account _publish profile_ file. A new browser window will pop up and you must login using your **Microsoft Account** credentials. 
    
    Once logged in, save the publish profile file in a known location (for example, 'C:\\')

	```CommandPrompt
	azure account download
	```

	![Downloading the account publish profile](images/download-publishsettings.png?raw=true "Downloading the account publish profile")

	_Downloading the account publish profile_

1. Go back to the Command Prompt and import the file downloaded in the step above by running the following command, specifying the publish profile file location in the _{publish_profile_file}_ placeholder (in this case *'C:\\'*).

	```CommandPrompt
	azure account import {publish_profile_file}
	```

---

<a name="Tutorial" />
## Tutorial ##

This tutorial is composed of the following segments:

1. [segment 1](#segment1)

<a name="segment1" />
### Service Bus Relay ###

1. Open **Visual Studio 2012** as administrator.

1. Click File | Open | Project/Solution and open the **ServiceBusRelay.Console.sln** solution file located at **\Source\ServiceBusRelay-Console**.

	> **Speaking Point**
	>
	> Let's open ServiceBusRelay Console application. This is a simple application that shows how to expose an on-premises SQL Database using Service Bus Relay services.

1. Press **F5** to run the console application. 

	![Service Bus Relay console Running](images/service-bus-relay-console-running.png?raw=true "Service Bus Relay console Running")

	_Service Bus Relay console Running_

	> **Speaking Point**
	>
	> Now, we'll run the console application. 
	>
	>The Service Bus allows a Windows Communication Foundation-based (WCF) application to listen to a public network address, even if the application is located behind a NAT or network firewall. This functionality can be used to help applications communicate with each other, regardless of network specific structure. Through the use of the Service Bus as an intermediary you can interconnect different applications without the need to write and maintain complex logic and code to traverse networks.


1. Open a new instance of **Visual Studio 2012** as administrator.

1. Open the **ServiceBusRelay.Web.sln** solution file located at **\Source\ServiceBusRelay-Web**.

1. Make sure the cloud project is set as startup project. To do this, right-click **ServiceBusRelay.Web.Azure** and select **Set as StartUp Project**.

1. Press **F5** to run the application.

1. Copy the URL from the browser window.

	![Service Bus Relay web Running](images/service-bus-relay-web-running.png?raw=true "Service Bus Relay web Running")

	_Service Bus Relay web Running_

	> **Speaking Point**
	>
	> Now we'll open a second application, this time a website that consumes the information that it is being exposed through the console application using Service Bus Relay services.

1. Open **Electric Mobile Simulator Lite**, select iPhone simulator and browse to the URL from the previous step.

	![Running the application using iPhone simulator](images/running-the-application-using-iphone-simulato.png?raw=true "Running the application using iPhone simulator")

	_Running the application using iPhone simulator_

	> **Speaking Point**
	>
	> Let's access the application from an iPhone simulator and make a call to one of the exposed methods.

1. Click **Customers**.

1. Switch to the running console application and notice the call received.

	![GetCustomers received call](images/getcustomers-received-call.png?raw=true "GetCustomers received call")

	_GetCustomers received call_

	> **Speaking Point**
	>
	> If we switch back to the console application, you will notice how the GetCustomers request was logged.

---

<a name="summary" />
## Summary ##

In this demonstration, you have seen how to implement Service Bus Relay services.