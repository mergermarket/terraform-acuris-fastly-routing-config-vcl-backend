 backend ${backend_name} {
            .connect_timeout = ${connect_timeout};
            .dynamic = ${dynamic};
            .first_byte_timeout = ${first_byte_timeout};
            .between_bytes_timeout = ${between_bytes_timeout};
            .max_connections = ${max_connections};
            .port = "${backend_port}";
            .host = "${backend_host}";

            .ssl = true;
            ${ssl_sni_hostname_section}
            .ssl_cert_hostname = "${ssl_cert_hostname}";
            ${ssl_ca_cert_section}
            .ssl_check_cert = ${ssl_check_cert};
            .probe = {
                .request = "HEAD $${healthcheck_path} HTTP/1.1" "Connection: close";
                .window = ${probe_window};
                .threshold = ${probe_threshold};
                .timeout = ${probe_timeout};
                .initial = ${probe_initial};
                .interval = ${probe_interval};
                ${dummy}
            }
        }