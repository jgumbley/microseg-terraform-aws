resource "terraform_remote_state" "foo" {
    backend = "s3"
    config {
        bucket = "microseg-terra"
        key = "network/terraform.tfstate"
        region = "us-east-1"
    }
}
