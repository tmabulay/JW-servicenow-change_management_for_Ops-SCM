[string] $organisation = "JELD-WEN-Europe"
[string] $personalAccessToken = "tjhgkrcl6xe5gikkmn7pv6gcfis74tl3x6w4yhhyacpej3qmd56a"

$base64AuthInfo= [System.Convert]::ToBase64String([System.Text.Encoding]::ASCII.GetBytes(":$($personalAccessToken)"))
$headers = @{Authorization=("Basic {0}" -f $base64AuthInfo)}

$result = Invoke-RestMethod -Uri "https://dev.azure.com/$organisation/_apis/projects?api-version=6.0" -Method Get -Headers $headers

$projects = $result.value



$report = foreach ($project in $projects) {
    $project_name = $project.name
    $repositories = Invoke-RestMethod -Uri "https://dev.azure.com/$organisation/$project_name/_apis/git/repositories?api-version=6.0" -Method Get -Headers $headers

    foreach ($repo in $repositories.value){
           @([pscustomobject]@{ 
                Project_Name = $project.name;
                Project_Description = $project.description;  
                Reposoty_Name = $repo.name
                Reposoty_size = $repo.size
                Reposoty_project = $repo.project
                }
            )
    }
}
$timeMilliSec = [DateTimeOffset]::UtcNow.ToUnixTimeMilliseconds()
$csv_report_sum = $report | Group-Object -Property Project_Name -NoElement | Sort-Object -Property Count -Descending 
$csv_report_all = $report | Select-Object Project_Name, Project_Description, Reposoty_Name, Reposoty_size 
$csv_report_sum | Export-Csv -Path ".\reports\$($timeMilliSec)_dev_azure_JW_report.csv" -NoTypeInformation
$csv_report_all| Export-Csv -Path ".\reports\$($timeMilliSec)_dev_azure_JW_all.csv" -NoTypeInformation
