### Context

Arr-bary is an end-to-end tool to spin up infrastructure and resources commonly
used to host Plex servers and all underlying apps to support retrieving and
managing legally ripped DVDs.

The name is derived from combining the popular 'Serv-Arr-Stack' name with
'Barbary', short for Barbary coast it was a stretch of North Africa's
Mediterranean coast infamous for its pirate havens between the 16th and early
19th centuries.

You can learn more about the Arr stack (a suite of apps used to automatically
grab, sort, organize, and monitor your Music, Movie, E-Book, or TV Show
collections) here: https://wiki.servarr.com/

### Spin Up Infrastructure

Install:

- Brew https://brew.sh/
- Terraform
  https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli

1. Create a new IAM role within the AWS account you want to use and save the
   access id/key

2. Install and configure the AWS CLI:
   https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html

3. Clone this repo and navigate to the infra folder `cd infra`

4. Run `terraform init && terraform apply` to spin up the cloud resources that
   will run the cluster

Notes:

- Terraform will instance an S3 bucket, DynamoDB table and t2.large instance,
  all of which will cost a small amount

- It is recommended to terminate the EC2 t2.large instance once you've finished
  as that comes with significant long-term running fees
