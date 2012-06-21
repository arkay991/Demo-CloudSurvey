<a name="HelloWorldWebSites" />
# Hello World - Windows Azure Web Site #

---

<a name="Overview" />
## Overview ##

In this tutorial you will upload an existing Web Site to the Windows Azure Web Sites service and get working on the cloud in a few minutes.

<a id="goals" />
### Goals ###
In this tutorial you will see:

1. How easy is to create a new Web Site in Windows Azure.

1. How to get working an existing ASP Legacy Web Site in a few minutes uploading it via FTP.

<a name="technologies" />
### Key Technologies ###

- [Windows Azure Web Sites][1]

[1]: https://www.windowsazure.com/en-us/home/scenarios/web-sites/

<a name="setup" />
### Setup and Configuration ###

(TODO: Insert setup steps here)

---

<a name="Tutorial" />
## Tutorial ##

This tutorial is composed of the following segments:

1. [Create a New Web Site Hosted in Windows Azure](#segment1).
1. [Upload an ASP Legacy page into the Windows Azure Web Site using FTP](#segment2).

<a name="segment1" />
#### Create a New Web Site Hosted in Windows Azure ####

> **Speaking Point**
>
> During this demo we're going to create a new Windows Azure Web Site.
>
> Let's start by opening Internet Explorer and accessing to the Windows Azure Management Portal.

1. Open Internet Explorer, go to the [Windows Azure Management portal](https://manage.windowsazure.com) and sign in using your **Microsoft Account** credentials associated with your subscription.

> **Speaking Point**
>
> Thanks to the Quick Create option from the Windows Azure Management Portal, we can now get a live Web Site working in seconds.

1. Click **New | Web Site | Quick Create** on the command bar. Provide an available URL (e.g. _hello-world-asp_) for the new web site and click **Create Web Site**.

	![Creating a new Web Site using Quick Create ](images/creating-a-new-web-site-using-quick-create-op.png?raw=true "Creating a new Web Site using Quick Create")

	_Creating a new web site using Quick Create_

1. Once the Web Site is created, click the link under the **URL** column to check that it is working.

	![Browsing to the new web site](images/browsing-to-new-site.png?raw=true "Browsing to the new web site")
	_Browsing to the new web site_

	![Web site running](images/web-site-running.png?raw=true "Web site running")

	_Web site running_

<a name="segment2" />
#### Upload an ASP Legacy page into the Windows Azure Web Site using FTP ####

> **Speaking Point**
>
> Next, we're going to get working on the cloud an existing ASP Legacy Web Site, in a few minutes uploading it via FTP.
>
> Let's go to the dashboard panel of the Web Site we have just created.

1. Back to the Windows Azure Management Portal, click your Web Site name, under the **Name** column to access the Dashboard.

	![Accessing the Web Site Dashboard](images/accessing-the-web-site-dashboard.png?raw=true "Accessing the Web Site Dashboard")

	_Accessing the Web Site Dashboard_

> **Speaking Point**
>
>  We can see at the Dashboard, a bunch of useful information about our Web Site. Such as useful reports about accessibility and hardware usage.
>
> We also can find there multiple options to upload content to your Web Sites. You can do it using GIT, TFS and FTP.

1. Show the information displayed at the Web Site Dashboard.

	![Web Site Dashboard](images/web-site-dashboard.png?raw=true "Web Site Dashboard")

	_Accessing the Web Site Dashboard_

> **Speaking Point**
>
> We are now going to specify a set of credentials that are required for using the FTP service.

1. Click **Reset deployment credentials** from the **Quick Glance** section.

	![Reseting Deployment Credentials](images/reset-deployment-credentials.png?raw=true "Reseting Deployment Credentials")

1. Enter a **User Name** and a **Password** for the FTP.

	![Setting up FTP Credentials](images/setting-ftp-credentials.png?raw=true "Setting up FTP Credentials")

	_Setting up FTP Credentials_

1. Access the Web Site's FTP by clicking the URL under **FTP Hostname** 

	![Opening Web Site FTP](images/open-ftp-url.png?raw=true "Opening Web Site FTP")

	_Opening Web Site FTP_

1. Insert FTP credentials for the FTP Service.

	![Inserting FTP Credentials](images/ftp-credentials-prompt.png?raw=true "Inserting FTP Credentials")

	_Inserting FTP Credentials_

---

<a name="summary" />
## Summary ##

In this tutorial, you saw how easy is to get your Web Site working on the cloud with Windows Azure.