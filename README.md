# module-docdb

Download the Amazon DocumentDB Certificate Authority (CA) certificate required to authenticate to your instanceCopy
wget https://s3.amazonaws.com/rds-downloads/rds-combined-ca-bundle.pem


Connect to this instance with the mongo shellCopy
mongo --ssl --host roboshop-dev-docdb.cdkob5uw5kab.us-east-1.docdb.amazonaws.com:27017 --sslCAFile rds-combined-ca-bundle.pem --username admin1 --password <insertYourPassword>

Connect to this instance with an applicationCopy
mongodb://admin1:<insertYourPassword>@roboshop-dev-docdb.cdkob5uw5kab.us-east-1.docdb.amazonaws.com:27017/?ssl=true&ssl_ca_certs=rds-combined-ca-bundle.pem&retryWrites=false