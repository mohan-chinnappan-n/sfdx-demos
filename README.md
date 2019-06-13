## SFDX Demos

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



