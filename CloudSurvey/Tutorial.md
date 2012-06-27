<a name="title" />
# Web Sites - CloudSurvey#

---

<a name="Overview" />
## Overview ##

This demonstration shows how to create a Web Site using the Azure command-line tool enabling it for GIT deploy and finally deploy it to Azure using the GIT commands.

> **Note:** In order to run through this complete demo, you must have network connectivity and a Microsoft account.

<a id="goals" />
### Goals ###
In this tutorial you will see how to:

1. Create a Web Site with GIT deploy enabled using the Azure command-line tool.
1. Configure a GIT repository to associated to an Azure Web Site.
1. Deploy a Web Site to Azure using GIT.
1. View the deployments history in the management portal.

<a name="technologies" />
### Key Technologies ###

This demo uses the following technologies:

- [Windows Azure Management Portal] [1]
- [GIT Source Control] [2]

[1]: https://manage.windowsazure.com/
[2]: http://git-scm.com/

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

<a name="segment1" />
### Publishing an application into a Windows Azure Web Site ###

1. Open a Git Bash command line and CD to the folder where you have the CloudSurvey application (in this case *c:/projects/cloudsurvey*).

	![Git Bash command line](images/git-bash-command-line.png?raw=true "Git Bash command line")

	_Git Bash command line_

	> **Speaking point:** We have this command line tools that works in Windows, Mac and Linux and it is really simply to use.

1. Execute the **azure** command to ensure Azure CLI Tools are installed and accesible within the Git Bash command line.

	![Azure Git Bash command line](images/azure-git-bash-command-line.png?raw=true "Azure Git Bash command line")

	_Azure Git Bash command line_

1. Run the following command to create the Windows Azure hosted site.

	```CommandPrompt
	azure site create --git
	```

	Provide a site name when prompted, for example, _CloudSurveyApp_.

	![Creating a new Web Site using the Command-Line Tools](images/new-web-site-cli.png?raw=true "Creating a new Web Site using the Command-Line Tools")

	_Creating a new Web Site using the Command-Line Tools_

	> **Note:** By specifying **--git** when running the command **site create** you don't need to run additional commands to initialize the Git repository or add the git remote, since these two tasks will be done automatically by the command line tools.

1. Now you will add the current files to the Git repository and push them. To do this, go back to the command prompt and execute the following commands. When prompted, provide your deployment credentials.

	```CommandPrompt
	git add .
	git commit -m "initial commit"
	git push azure master
	```
	![Pushing the site files](images/push-site.png?raw=true "Pushing the site files")

	_Pushing the site files_

	> **Note:** Deployment credentials are other than the Microsoft Account associated with your Windows Azure subscription and are valid for use with all Windows Azure web sites associated with your subscription. If you don't know your deployment credentials you can easily reset them using the management portal. Open the web site's **Dashboard** page and click the **Reset deployment credentials** link. Provide a new password and click Ok.
	>
	>![Resetting the deployment credentials](images/reset-credentials-cli.png?raw=true "Resetting the deployment credentials")
	>
	>_Resetting the deployment credentials_

1. Run the following command to open the site in the Windows Azure Management portal and provide your Microsoft Account credentials associated with the subscription to sign in.

	```CommandPrompt
	azure site portal
	```

	> **Speaking Point:** Let's check that the publishing was successful.

1. In the Windows Azure portal, click your site in the Web Site list and open the **Deployments** page of the site. Check out the latest deployment.

	![Web Site deployments](images/site-deployments.png?raw=true "Web Site deployments")

	_Web Site deployments_

1. Now execute the following command to browse to the web site and make sure it runs successfully.

	```CommandPrompt
	azure site browse
	```

	![Published web site](images/website-working-cli.png?raw=true "Published web site")

	_Published web site_

---

<a name="summary" />
## Summary ##

In this tutorial, you saw how to easily create a website and deploy using the Azure Command Line Tools.