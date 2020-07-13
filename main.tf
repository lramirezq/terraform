provider "aws" {
  profile = "${var.profile}"
  region  = "${var.region}"
}

terraform{
  backend "s3"{
  bucket  = "&terraform_bucket&"
  key     = "&terraform_key&"
  region  = "&terraform_region&"
  }
}

