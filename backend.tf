terraform {
  backend "s3" {
    bucket = "statebuckets3"
    key    = "state" #where the key must be stored in the bucket
    region = "us-east-1"
    dynamodb_table = "statetable" #state locking, state can only be changed by one person at a time
  }
}
