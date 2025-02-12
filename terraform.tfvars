environment              = "dev"
project                  = "go"
owner                    = "Bartlomiej Peruzynski"
region-name              = "eu-central-1"
vpc-cidr-block           = "10.0.0.0/16"
vpc-name                 = "go-vpc"
igw-name                 = "go-igw"
nat-gw-name              = "go-nat-gw"
web-subnet1-cidr         = "10.0.1.0/24"
web-subnet1-name         = "go-web-subnet-1"
web-subnet2-cidr         = "10.0.2.0/24"
web-subnet2-name         = "go-web-subnet-2"
app-subnet1-cidr         = "10.0.3.0/24"
app-subnet1-name         = "go-app-subnet-1"
app-subnet2-cidr         = "10.0.4.0/24"
app-subnet2-name         = "go-app-subnet-2"
db-subnet1-cidr          = "10.0.5.0/24"
db-subnet1-name          = "go-db-subnet-1"
db-subnet2-cidr          = "10.0.6.0/24"
db-subnet2-name          = "go-db-subnet-2"
az-1                     = "eu-central-1a"
az-2                     = "eu-central-1b"
public-rt-name           = "go-public-route-table"
private-rt-name          = "go-private-rote-table"
launch-template-web-name = "go-launch-template-web"
instance-type            = "t2.micro"
# key-name                 = "jenkins"
web-instance-name        = "go-web-instances"
alb-web-name             = "go-alb-web"
alb-sg-web-name          = "go-alb-sg-web"
asg-web-name             = "go-asg-web"
asg-sg-web-name          = "go-asg-sg-web"
tg-web-name              = "go-tg-web"
launch-template-app-name = "go-launch-template-app"
app-instance-name        = "go-app-instances"
alb-app-name             = "go-alb-app"
alb-sg-app-name          = "go-alb-sg-app"
asg-app-name             = "go-asg-app"
asg-sg-app-name          = "go-asg-sg-app"
tg-app-name              = "go-tg-app"
db-name                  = "mydb"
instance-class           = "db.t3.micro"
db-sg-name               = "go-db-sg"
db-subnet-grp-name       = "go-db-subnet-grp"
app-db-sg-name           = "go-app-db"
