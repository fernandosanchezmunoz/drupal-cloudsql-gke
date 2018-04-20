resource "kubernetes_persistent_volume_claim" "pvc_1" {
  metadata {
    name = "${var.vol_1}-claim"
  }
  spec {
    access_modes = ["ReadWriteMany"]
    resources {
      requests {
        storage = "${var.vol_1_size}"
      }
    }
    volume_name = "${kubernetes_persistent_volume.vol_1.metadata.0.name}"
  }
}
