resource "kubernetes_namespace" "default" {
  metadata {
    name = K8S_NAMESPACE_NAME
  }
}

resource "kubernetes_deployment" "api" {
  metadata {
    name      = K8S_DEPLOYMENT_NAME
    namespace = kubernetes_namespace.default.metadata[0].name
  }

  spec {
    replicas = K8S_REPLICAS

    selector {
      match_labels = {
        app = K8S_APP_NAME
      }
    }

    template {
      metadata {
        labels = {
          app = K8S_APP_NAME
        }
      }

      spec {
        container {
          image = K8S_CONTAINER_IMAGE
          name  = K8S_CONTAINER_NAME

          port {
            container_port = K8S_CONTAINER_PORT
          }
        }
      }
    }
  }
}

resource "kubernetes_service" "api" {
  metadata {
    name      = K8S_SERVICE_NAME
    namespace = kubernetes_namespace.default.metadata[0].name
  }

  spec {
    selector = {
      app = K8S_APP_NAME
    }

    port {
      name        = "http"
      port        = K8S_SERVICE_PORT
      target_port = K8S_SERVICE_TARGET_PORT
    }

    type = "LoadBalancer"
  }
}