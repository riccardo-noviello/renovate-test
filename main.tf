terraform {
  backend "azurerm" {}
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">=2.76.0"
    }
    pagerduty = {
      source  = "PagerDuty/pagerduty"
      version = "~> 2.0"
    }
    newrelic = {
      source  = "newrelic/newrelic"
      version = "~> 2.41.2"
    }
    github = {
      source  = "integrations/github"
      version = "6.2.1"
    }
  }
}


module "some_module" {
  # renovate: datasource=github-releases depName=DigitalInnovation/terraform-mns-pagerduty extractVersion=^v(?<ref=>.*)$
  source    = "git@github.com:PagerDuty/terraform-provider-pagerduty.git?ref=v2.0.0"
  app_name  = "bla"
  threshold = 1
  duration  = 60
}
