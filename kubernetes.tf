resource "kubernetes_namespace" "default" {
  metadata {
    name = "Gomez-space"
  }
}

resource "kubernetes_deployment" "api" {
  metadata {
    name      = "time-checker-api"
    namespace = kubernetes_namespace.default.metadata[0].name
  }

  spec {
    replicas = 1

    selector {
      match_labels = {
        app = "time-checker-api"
      }
    }

    template {
      metadata {
        labels = {
          app = "time-checker-api"
        }
      }

      spec {
        container {
          image = "gcr.io/your-project-id/my-api:latest"
          name  = "time-checker-api"

          port {
            container_port = 5000
          }
        }
      }
    }
  }
}

resource "kubernetes_service" "api" {
  metadata {
    name      = "time-chceker-api"
    namespace = kubernetes_namespace.default.metadata[0].name
  }

  spec {
    selector = {
      app = "time-checker-api"
    }

    port {
      name        = "http"
      port        = 80
      target_port = 8000
    }

    type = "LoadBalancer"
  }
}