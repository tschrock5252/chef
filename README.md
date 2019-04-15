# chef

This is a repository built specifically for maintaining Chef locally in my environment.

## Getting Started

Feel free to follow the instructions below to get a copy of these files set up on your local machine for development and testing purposes.

### Prerequisites

Each cookbook may require its own prerequisites. Those will be outlined in the **cookbooks** section below.

### Installing

```
Step 1) Fork a copy of the repository in github which is located here: https://github.com/tschrock5252/chef

Step 2) On your local machine, move to a new folder to work within and create a new git repository with: git init

Step 3) Add a new origin using the following command: git remote add origin git@github.com:your_username/chef.git

Step 4) Download all files using: git pull origin master
```

### cookbooks

#### example_chef_website

This is a very simple LAMP stack which I have set up at this time to demonstrate my capabilities with Chef!

* This cookbook has only been tested on CentOS 7.
* This cookbook requires a data bag named example_chef_website_mysql_root_password. Setup for that is outlined in more detail in that cookbook's README.md file.

