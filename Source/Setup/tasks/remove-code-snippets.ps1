Param([string] $CSharpSnippets,
	[string] $htmlSnippets,
	[string] $xmlSnippets)
	
write-host "========= Removing Code Snippets ... ========="
[string] $documentsFolder = [Environment]::GetFolderPath("MyDocuments")
if (-NOT (test-path "$documentsFolder"))
{
    $documentsFolder = "$env:UserProfile\Documents";
}
[string] $myCSharpSnippetsLocation = "$documentsFolder\Visual Studio 2012\Code Snippets\Visual C#\My Code Snippets"
[string] $myHtmlSnippetsLocation = "$documentsFolder\Visual Studio 2012\Code Snippets\Visual Web Developer\My HTML Snippets"
[string] $myXmlSnippetsLocation = "$documentsFolder\Visual Studio 2012\Code Snippets\XML\My Xml Snippets"

if($CSharpSnippets -AND (test-path $CSharpSnippets))
{
    gci $CSharpSnippets | Where-Object { $_.Name -like "*.snippet" } | ForEach-Object { 
		$filePath = Join-Path $myCSharpSnippetsLocation $_.Name
		if (Test-Path $FilePath){
			Remove-Item $FilePath -force
		}
	}
}

if($htmlSnippets -AND (test-path $htmlSnippets))
{
	gci $htmlSnippets | Where-Object { $_.Name -like "*.snippet" } | ForEach-Object { 
		$filePath = Join-Path $myHtmlSnippetsLocation $_.Name
		if (Test-Path $FilePath){
			Remove-Item $FilePath -force
		}
	}
}

if($xmlSnippets -AND (test-path $xmlSnippets))
{
	gci $xmlSnippets | Where-Object { $_.Name -like "*.snippet" } | ForEach-Object { 
		$filePath = Join-Path $myXmlSnippetsLocation $_.Name
		if (Test-Path $FilePath){
			Remove-Item $FilePath -force
		}
	}
}
write-host "Removing Code Snippets done!"