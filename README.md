# Database IaC

Repository responsible to provisioning the application databases (SQL and Cache) in AWS.

# Local Development

## Requirements

- [Terraform](https://www.terraform.io/downloads.html)
- [Terraform Docs](https://github.com/terraform-docs/terraform-docs)
- [AWS CLI](https://aws.amazon.com/cli/)

## Manual deployment

### Attention

Before deploying the databases, make sure to set the `AWS_ACCESS_KEY_ID` and `AWS_SECRET_ACCESS_KEY` environment variables.

Be aware that this process will take a few minutes (~20 minutes) to be completed.

To deploy the databases manually, run the following commands in order:

```bash
make init
make check # this will execute fmt, validate and plan
make apply
```

To destroy the databases, run the following command:

```bash
make destroy
```

## Automated deployment

The automated deployment is triggered by a GitHub Action.

# Provisioning
<!-- BEGIN_TF_DOCS -->

## Requirements

| Name                                                                      | Version |
| ------------------------------------------------------------------------- | ------- |
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | 1.7.4   |
| <a name="requirement_aws"></a> [aws](#requirement\_aws)                   | 5.38.0  |
## Providers

No providers.
## Inputs

| Name                                                         | Description                               | Type          | Default                                  | Required |
| ------------------------------------------------------------ | ----------------------------------------- | ------------- | ---------------------------------------- | :------: |
| <a name="input_region"></a> [region](#input\_region)         | The default region to use for AWS         | `string`      | `"us-east-1"`                            |    no    |
| <a name="input_tags"></a> [tags](#input\_tags)               | The default tags to use for AWS resources | `map(string)` | <pre>{<br>  "App": "database"<br>}</pre> |    no    |
| <a name="input_vpc_name"></a> [vpc\_name](#input\_vpc\_name) | The name of the VPC                       | `string`      | `"vpc-healthmed"`                        |    no    |
## Modules

| Name                                                                                | Source                 | Version |
| ----------------------------------------------------------------------------------- | ---------------------- | ------- |
| <a name="module_appointments_db"></a> [appointments\_db](#module\_appointments\_db) | ./modules/database_sql | n/a     |
| <a name="module_cache"></a> [cache](#module\_cache)                                 | ./modules/cache        | n/a     |
| <a name="module_scheduler_db"></a> [scheduler\_db](#module\_scheduler\_db)          | ./modules/database_sql | n/a     |
| <a name="module_users_db"></a> [users\_db](#module\_users\_db)                      | ./modules/database_sql | n/a     |
## Resources

No resources.
## Outputs

No outputs.
<!-- END_TF_DOCS -->

# License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.