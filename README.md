## SFDX Demos

### Agenda

- How to setup a Dev Hub for the development
    - [DX Fundamentals](https://mohan-chinnappan-n.github.io/sfdc/dx.html#/32)

- Create a project (GreenProject)

- Creating a Git repo for source-based development (instead of Org-based development)

-  Scratch org creation for the development

-  Explain how to synch project folder and Scratch Org
    - Config
        - In the Org create a new field in Account.GreenProjectInUse__c (config)
        - Sync that with the project folder using source:pull
    - Coding
        - In the project folder create Apex class (AccountCtrl) using apex:class:create 
        - Sync that with the scratch org using source:push
        - In the scratch org UI - Developer Console update AccountCtrl.cls
        - Sync that with the project folder using source:pull 

- Provide Branching suggestion and talk about merging
    - [Branching](https://mohan-chinnappan-n.github.io/sfdc/dx.html#/25)

- Demo (recorded) how to build a Stock Quote LWC (Lightning Web Component) using SFDX
    - [LWC SFDX Demo](https://mohan-chinnappan-n2.github.io/2019/dx/dx-demos.html#Use%20Case)

- SFDX Plugins
    - [Plugins doc](https://mohan-chinnappan-n.github.io/dx/plugins.html#/home)


- Talk about CI/CD with Jenkins and share the recorded demo
    - [CI/CD Demo](https://mohan-chinnappan-n.github.io/dx/dx-ci.html#/1)

- Package Development
    - [Packages fundamentals](https://mohan-chinnappan-n2.github.io/2019/dx/dx-2.html#Package%20Development)

###

``` bash

# see org list
sfdx force:org:list 

##------------------------------------
## get a DEV HUB org

# here: https://developer.salesforce.com/promotions/orgs/dx-signup

## my DEV HUB username: mohan.chinnappan.dh25@gmail.com
##------------------------------------



##------------------------------------
# Login into DEV Hub via CLI
## ref: https://mohan-chinnappan-n.github.io/sfdc/dx.html#/34

## -d :  set the authenticated org as the default dev hub org for scratch org creation
## -a : set an alias for the authenticated org

sfdx force:auth:web:login -d -a DevHub

### you will be asked for this permission:

# Salesforce CLI is asking to:

# Access your basic information
# Provide access to your data via the Web
# Access and manage your data
# Perform requests on your behalf at any time
# Do you want to allow access for mohan.chinnappan.dh25@gmail.com? (Not you?)

### CLICK [Allow]

## you will be logged in: https://amazing-cloudy-210392.lightning.force.com/lightning/n/Getting_Started

## Check active scratch orgs

##------------------------------------

sfdx force:org:list 



=== Orgs
     ALIAS     USERNAME                           ORG ID              CONNECTED STATUS
───  ────────  ─────────────────────────────────  ──────────────────  ────────────────
               mohan.chinnappan.n33@gmail.com     00Df4000002db0kEAA  Connected
               mohan.chinnappan.n_ea@gmail.com    00D1N000001Tjk2UAC  Connected
(D)  DevHub    mohan.chinnappan.dh25@gmail.com    00D4P000000yzuxUAA  Connected <---
     lwc1_org  mohan.chinnappan.n-hhet@force.com  00DB0000000K3yVMAS  Connected

No active scratch orgs found. Specify --all to see all scratch orgs

```

### Create SFDX Project

```bash

sfdx force:project:create -n GreenProject

target dir = /Users/mchinnappan/sfdx-demos
   create GreenProject/sfdx-project.json
   create GreenProject/README.md
   create GreenProject/.forceignore
   create GreenProject/config/project-scratch-def.json


##--------------------------
$ tree GreenProject
GreenProject/
├── README.md
├── config
│   └── project-scratch-def.json
├── force-app
│   └── main
│       └── default
│           ├── aura
│           └── lwc
└── sfdx-project.json

6 directories, 3 files




```


### check-in to git

``` bash
 git add -A
 git commit -m 'project init'
[master 6761eb9] project init
 5 files changed, 139 insertions(+), 1 deletion(-)
 create mode 100644 GreenProject/.forceignore
 create mode 100644 GreenProject/README.md
 create mode 100644 GreenProject/config/project-scratch-def.json
 create mode 100644 GreenProject/sfdx-project.json
 rewrite README.md (100%)

 git remote add origin https://github.com/mohan-chinnappan-n/sfdx-demos.git

 git push origin master

Counting objects: 12, done.
Delta compression using up to 8 threads.
Compressing objects: 100% (10/10), done.
Writing objects: 100% (12/12), 2.19 KiB | 2.19 MiB/s, done.
Total 12 (delta 1), reused 0 (delta 0)
remote: Resolving deltas: 100% (1/1), done.
To https://github.com/mohan-chinnappan-n/sfdx-demos.git
 * [new branch]      master -> master


```

### Scratch org creation

```bash

# list active scratch orgs
sfdx force:limits:api:display -u DevHub


 sfdx force:limits:api:display -u DevHub
NAME                                   REMAINING  MAXIMUM
─────────────────────────────────────  ─────────  ─────────
ActiveScratchOrgs                      20         20
ConcurrentAsyncGetReportInstances      200        200
ConcurrentSyncReportRuns               20         20
DailyAnalyticsDataflowJobExecutions    60         60
DailyApiRequests                       14996      15000
DailyAsyncApexExecutions               250000     250000
DailyBulkApiRequests                   10000      10000
DailyDurableGenericStreamingApiEvents  200000     200000
DailyDurableStreamingApiEvents         200000     200000
DailyGenericStreamingApiEvents         10000      10000
DailyScratchOrgs                       40         40
DailyStandardVolumePlatformEvents      25000      25000
DailyStreamingApiEvents                200000     200000
DailyWorkflowEmails                    150        150
DataStorageMB                          10440      10440
DurableStreamingApiConcurrentClients   999        1000
FileStorageMB                          1024       1024
HourlyAsyncReportRuns                  1200       1200
HourlyDashboardRefreshes               200        200
HourlyDashboardResults                 5000       5000
HourlyDashboardStatuses                999999999  999999999
HourlyLongTermIdMapping                100000     100000
HourlyODataCallout                     20000      20000
HourlyShortTermIdMapping               100000     100000
HourlySyncReportRuns                   500        500
HourlyTimeBasedWorkflow                50         50
MassEmail                              10         10
MonthlyPlatformEvents                  750000     750000
Package2VersionCreates                 40         40
PermissionSets                         1499       1500
SingleEmail                            15         15
StreamingApiConcurrentClients          1000       1000


Scratch orgs have these storage limits:

    200 MB for data
    50 MB for files

ref: https://developer.salesforce.com/docs/atlas.en-us.sfdx_dev.meta/sfdx_dev/sfdx_dev_scratch_orgs.htm

Edition 	Active Scratch Org Allocation 	Daily Scratch Org Allocation
Developer Edition or trial 	3 	6
Enterprise Edition 	40 	80
Unlimited Edition 	100 	200
Performance Edition 	100 	200

##=============

cd GreenProject

# -s, --setdefaultusername                         set the created org as the default org for this project
# -f, --definitionfile DEFINITIONFILE              path to a scratch org definition file
# -a, --setalias SETALIAS                          set an alias for for the created scratch org
# -d, --durationdays DURATIONDAYS                  duration of the scratch org (in days) (default:7, min:1, max:30)

sfdx force:org:create -s -f config/project-scratch-def.json -a gp_sorg_1
Successfully created scratch org: 00D540000001L9YEAU, username: test-814uzdqzt3jg@example.com

$ sfdx force:org:list 
=== Orgs
     ALIAS     USERNAME                           ORG ID              CONNECTED STATUS
───  ────────  ─────────────────────────────────  ──────────────────  ────────────────
               mohan.chinnappan.n33@gmail.com     00Df4000002db0kEAA  Connected
               mohan.chinnappan.n_ea@gmail.com    00D1N000001Tjk2UAC  Connected
(D)  DevHub    mohan.chinnappan.dh25@gmail.com    00D4P000000yzuxUAA  Connected
     lwc1_org  mohan.chinnappan.n-hhet@force.com  00DB0000000K3yVMAS  Connected

     ALIAS      SCRATCH ORG NAME     USERNAME                       ORG ID              EXPIRATION DATE
───  ─────────  ───────────────────  ─────────────────────────────  ──────────────────  ───────────────
(U)  gp_sorg_1  mchinnappan Company  test-814uzdqzt3jg@example.com  00D540000001L9YEAU  2019-06-20   <------

```

### Open the created Scratch org

``` bash

# u, --targetusername TARGETUSERNAME  username or alias for the target org; overrides default target org
sfdx force:org:open -u gp_sorg_1

# gp_sorg_1 https://agility-energy-5928-dev-ed.lightning.force.com/lightning/setup/SetupOneHome/home

# look at the active orgs in DevHub, you should see this scratch org gp_sorg1 in the list
##  https://amazing-cloudy-210392.lightning.force.com/lightning/o/ActiveScratchOrg/list?filterName=Recent






```

### Create Account.GreenProjectInUse__c	Checkbox field in UI and pull into project folder

``` bash

Account.GreenProjectInUse__c	Checkbox

sfdx force:source:pull -u gp_sorg_1

=== Pulled Source
STATE  FULL NAME                               TYPE         PROJECT PATH
─────  ──────────────────────────────────────  ───────────  ─────────────────────────────────────────────────────────────────────────────────────
Add    Account.GreenProjectInUse__c            CustomField  force-app/main/default/objects/Account/fields/GreenProjectInUse__c.field-meta.xml
Add    Account-Account %28Marketing%29 Layout  Layout       force-app/main/default/layouts/Account-Account %28Marketing%29 Layout.layout-meta.xml
Add    Account-Account %28Sales%29 Layout      Layout       force-app/main/default/layouts/Account-Account %28Sales%29 Layout.layout-meta.xml
Add    Account-Account %28Support%29 Layout    Layout       force-app/main/default/layouts/Account-Account %28Support%29 Layout.layout-meta.xml
Add    Account-Account Layout                  Layout       force-app/main/default/layouts/Account-Account Layout.layout-meta.xml
Add    Admin                                   Profile      force-app/main/default/profiles/Admin.profile-meta.xml
Add    Custom%3A Support Profile               Profile      force-app/main/default/profiles/Custom%3A Support Profile.profile-meta.xml
Add    Custom%3A Sales Profile                 Profile      force-app/main/default/profiles/Custom%3A Sales Profile.profile-meta.xml
Add    Custom%3A Marketing Profile             Profile      force-app/main/default/profiles/Custom%3A Marketing Profile.profile-meta.xml

```

### Check into git

``` bash

git add -A
git commit -m 'added Account.GreenProjectInUse__c field'
git push origin master

```

### Create an Apex class: AccountCtrl using CLI
``` bash
sfdx force:apex:class:create -n AccountCtrl -d force-app/main/default/classes

target dir = /Users/mchinnappan/sfdx-demos/GreenProject/force-app/main/default/classes
   create AccountCtrl.cls
   create AccountCtrl.cls-meta.xml

$ tree
.
├── README.md
├── config
│   └── project-scratch-def.json
├── force-app
│   └── main
│       └── default
│           ├── aura
│           ├── classes
│           │   ├── AccountCtrl.cls
│           │   └── AccountCtrl.cls-meta.xml
│           ├── layouts
│           │   ├── Account-Account\ %28Marketing%29\ Layout.layout-meta.xml
│           │   ├── Account-Account\ %28Sales%29\ Layout.layout-meta.xml
│           │   ├── Account-Account\ %28Support%29\ Layout.layout-meta.xml
│           │   └── Account-Account\ Layout.layout-meta.xml
│           ├── lwc
│           ├── objects
│           │   └── Account
│           │       └── fields
│           │           └── GreenProjectInUse__c.field-meta.xml
│           └── profiles
│               ├── Admin.profile-meta.xml
│               ├── Custom%3A\ Marketing\ Profile.profile-meta.xml
│               ├── Custom%3A\ Sales\ Profile.profile-meta.xml
│               └── Custom%3A\ Support\ Profile.profile-meta.xml
└── sfdx-project.json

cat force-app/main/default/classes/AccountCtrl.cls
public with sharing class AccountCtrl {
    public AccountCtrl() {

    }
}

### push this Apex class into the Scratch Org

sfdx force:source:push

$ sfdx force:source:push
=== Pushed Source
STATE  FULL NAME    TYPE       PROJECT PATH
─────  ───────────  ─────────  ───────────────────────────────────────────────────────
Add    AccountCtrl  ApexClass  force-app/main/default/classes/AccountCtrl.cls
Add    AccountCtrl  ApexClass  force-app/main/default/classes/AccountCtrl.cls-meta.xml

```
### Make some edits in this Apex Class using UI in Scratch Org

```java

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


```


### source pull from the scratch org to the project folder

``` bash

sfdx force:source:pull -u gp_sorg_1

$ sfdx force:source:pull -u gp_sorg_1
=== Pulled Source
STATE    FULL NAME    TYPE       PROJECT PATH
───────  ───────────  ─────────  ───────────────────────────────────────────────────────
Changed  AccountCtrl  ApexClass  force-app/main/default/classes/AccountCtrl.cls-meta.xml
Changed  AccountCtrl  ApexClass  force-app/main/default/classes/AccountCtrl.cls
Changed  Admin        Profile    force-app/main/default/profiles/Admin.profile-meta.xml

## Check the Apex class source in the project folder

$ cat force-app/main/default/classes/AccountCtrl.cls
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


### Check-in to the repo

git add -A
git commit -m 'added AccountCtrl apex class'
git push origin master


```


## Branching

- [Branching](https://mohan-chinnappan-n.github.io/sfdc/dx.html#/25)

##  Creating a stock quote LWC (Lightning Web Component App) using SFDX

- [stock quote LWC ](https://mohan-chinnappan-n2.github.io/2019/dx/dx-demos.html#Component%20Diagram)




