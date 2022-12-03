provider "google" {
  project = "barbero-devops-iac"
  region  = "us-central1"
  zone    = "us-central1-c"
  credentials = "${file("serviceaccount.yaml")}"
}

resource "google_folder" "Financeiro" {
  display_name = "Financeiro"
  parent       = "organizations/540829645030"
}

resource "google_folder" "SalesForce" {
  display_name = "SalesForce"
  parent       = google_folder.Financeiro.name
}

resource "google_folder" "Desenvolvimento" {
  display_name = "Desenvolvimento"
  parent       = google_folder.SalesForce.name
}

resource "google_folder" "Producao" {
  display_name = "Producao"
  parent       = google_folder.SalesForce.name
}


resource "google_project" "barberosa2-salesforce-dev" {
  name       = "SalesForce-Dev"
  project_id = "barberosa2-salesforce-dev"
  folder_id  = google_folder.Desenvolvimento.name
  auto_create_network=false
  billing_account = "018973-A8340F-83D8E5"

}

# resource "google_project" "barberosa-salesforce-prod" {
#   name       = "SalesForce-Prod"
#   project_id = "barberosa-salesforce-prod"
#   folder_id  = google_folder.Producao.name
#   auto_create_network=false
#   billing_account = "01B2C4-70459E-F53446"
# }

resource "google_folder" "Comercial" {
  display_name = "Comercial"
  parent       = "organizations/540829645030"
}

resource "google_folder" "Mobile" {
  display_name = "Mobile"
  parent       = google_folder.Comercial.name
}

resource "google_folder" "ERP" {
  display_name = "ERP"
  parent       = google_folder.Comercial.name
}

resource "google_folder" "Desenvolvimento" {
  display_name = "Desenvolvimento"
  parent       = google_folder.Mobile.name
}

resource "google_folder" "Producao" {
  display_name = "Producao"
  parent       = google_folder.Mobile.name
}

resource "google_folder" "Desenvolvimento" {
  display_name = "Desenvolvimento"
  parent       = google_folder.ERP.name
}

resource "google_folder" "Producao" {
  display_name = "Producao"
  parent       = google_folder.ERP.name
}


resource "google_project" "barbero-comercial-mobile-dev" {
  name       = "Mobile Dev"
  project_id = "barberosa-comercial-mobile-dev"
  folder_id  = google_folder.Desenvolvimento.name
  auto_create_network=false
  billing_account = "018973-A8340F-83D8E5"

}

resource "google_project" "barberosa-comercial-mobile-prod" {
  name       = "Mobile Prod"
  project_id = "barberosa-comercial-mobile-dev"
  folder_id  = google_folder.Desenvolvimento.name
  auto_create_network=false
  billing_account = "018973-A8340F-83D8E5"

}



resource "google_project" "barbero-comercial-erp-dev" {
  name       = "ERP Dev"
  project_id = "barberosa-comercial-erp-dev"
  folder_id  = google_folder.Desenvolvimento.name
  auto_create_network=false
  billing_account = "018973-A8340F-83D8E5"

}


resource "google_project" "barbero-comercial-erp-prod" {
  name       = "ERP Producao"
  project_id = "barberosa-comercial-erp-prod"
  folder_id  = google_folder.Desenvolvimento.name
  auto_create_network=false
  billing_account = "018973-A8340F-83D8E5"

}