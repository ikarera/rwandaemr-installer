# rwandaemr-installer

Tools to support installation, upgrades, and maintenance of a RwandaEMR implementation
 
### Overall goals

Develop and publish a set of tools that facilitate the installation of the RwandaEMR across a variety of
environments, encouraging consistency and shared utilities for development, testing, demo, and production usages.

Provide scripts that abstract away the usage of newer, less familiar technologies, while still
allowing for the usage of these technologies to expand in a tranparent and scalable manner

### Specific tools

* [Migrating a database from 1.9 to 2.3](docs/migration.md)

* [Installation of a RwandaEMR 2.3 distribution](docs/installation.md)

### Aims

* Provision base server environment
  * In any given environment, this could involve manual installation, Ansible playbooks, Puppet, etc.
  * This would be relatively minimal, involving steps like:
    * Creating users and groups and assigning permissions
    * Install system libraries (zip, wget, etc) and security updates
    * Install the appropriate versions of Java, Maven, Docker, Docker-Compose
    * Install the appropriate version of the rwandaemr-installer package (this repository), either by:
      * Downloading a specific Zip archive from github (eg. https://github.com/PIH/rwandaemr-installer/archive/master.zip)
      * Downloading a Zip archive from Maven (eg. https://openmrs.jfrog.io/artifactory/modules-pih-snapshots/org/openmrs/distro/rwandaemr-installer)
      * Checking out the code from github and executing it manually (eg. in a dev environment)

* Provision Rwanda EMR
  * This would use the shell scripts, Ansible playbooks, and other tools provided in this package
  * These tools should be agnostic to environment (should be useful in dev/test/prod/etc)
  * Entire provisioned distribution should be managed within a single directory, managed by a named user
    * In a single-instance prod/test environment, likely under "/opt/openmrs", owned and executed by user "openmrs"
    * In a multi-instance prod/test environment, under alternative dirs/users, eg: "/opt/butaro1x", user "butaro1x"
    * On a developer machine, in the user's directory of choice, as their user (eg. ~/environments/butaro1x, user $user)
  * Main functions would do steps like the following:
    * Download/install the appropriate distribution artifact (eg. rwandaemr-imb-butaro-2.0.0-SNAPSHOT)
    * Download/install appropriate version of docker containers (eg. docker pull partnersinhealth/openmrs-server:latest)
    * Download/install appropriate starter databases (eg. using existing DB backup, existing DB data dir, etc.)
    * Start and stop appropriate services (eg. docker-compose up ... )
    * etc.
  * These tools should establish best practices and standards for given environments.  Examples:
    * Add nginx or apache with SSL certificates in test/prod environments
    * Add ability to enable additional services as appropriate (log rotating, backups, etl services, etc)
  * These tools should eventually be expanded to support other tools as appropriate:
    * Updating to new versions
    * Installing metadata and updating configurations
    * etc.
