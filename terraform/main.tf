provider "google" {
    project = var.project_id
    region = var.region
}

resource "google_cloud_run_service" "default" {
    name = "icarust-cloudrun"
    location = var.region

    template {
        spec {
            containers {
                image = var.image_url
                ports {
                    container_port = 8080
                }
            }
            timeout_seconds = 180
        }
    }

    traffic {
        percent = 100
        latest_revision = true
    }
}

resource "google_cloud_run_service_iam_member" "invoker" {
    location = var.region
    service  = google_cloud_run_service.default.name
    role     = "roles/run.invoker"
    member   = "allUsers"
}