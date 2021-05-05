output "vcl_backend" {
  value = templatefile("${path.module}/template.vcl",
    {
      backend_name             = var.backend_name
      first_byte_timeout       = var.first_byte_timeout
      connect_timeout          = var.connect_timeout
      dynamic                  = var.dynamic
      between_bytes_timeout    = var.between_bytes_timeout
      max_connections          = var.max_connections
      backend_port             = var.backend_port
      backend_host             = var.backend_host
      ssl_sni_hostname_section = var.ssl_sni_hostname == "" ? "" : join("", [".ssl_sni_hostname = \"", var.ssl_sni_hostname, "\";"])
      ssl_ca_cert_section      = var.ssl_ca_cert == "" ? "" : join("", [".ssl_ca_cert = {\"", var.ssl_ca_cert, "\"};"])
      ssl_cert_hostname        = var.ssl_cert_hostname == "" ? var.backend_host : var.ssl_cert_hostname
      ssl_check_cert           = var.ssl_check_cert
      probe_window             = var.probe_window
      probe_threshold          = var.probe_threshold
      probe_timeout            = var.probe_timeout
      probe_interval           = var.probe_interval
      probe_initial            = var.probe_initial
      healthcheck_path         = var.healthcheck_path
      dummy                    = var.probe_enabled ? "" : ".dummy = true;"
    }
  )
}

