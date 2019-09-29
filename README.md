# rail-season-ticket
Script to create CSV file of rail season ticket prices using ATOC data

## Prerequisites
* Docker
* Docker Compose
* Fare data from the Rail Delivery Group.  Available for download here: http://data.atoc.org/data-download (registration required).

## Running
1. Copy fare data zip file to data.
2. Update `ZIP_FILE` in .env if required.
3. Run `./run.sh`

A csv file will be created in output/.
