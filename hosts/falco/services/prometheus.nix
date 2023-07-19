{ config, ... }:
{
  services = {
    prometheus = {
      enable = true;
      globalConfig = {
        # Scrape a bit more frequently
        scrape_interval = "30s";
      };
      scrapeConfigs = [
        {
          job_name = "hydra";
          scheme = "https";
          static_configs = [{
            targets = [ "hydra.joka00.dev" ];
          }];
        }
        {
          job_name = "headscale";
          scheme = "https";
          static_configs = [{
            targets = [ "tailscale.joka00.dev" ];
          }];
        }
        {
          job_name = "nginx";
          scheme = "https";
          static_configs = [{
            targets = [ "alcyone.joka00.dev" "celaeno.joka00.dev" "merope.joka00.dev" ];
          }];
        }
        {
          job_name = "sitespeed";
          scheme = "https";
          static_configs = [{
            targets = [ "sitespeed.joka00.dev" ];
          }];
          metric_relabel_configs = [
            # Only keep metrics that are not aggregations or are medians
            {
              source_labels = [ "aggr_kind" ];
              regex = "(median|)";
              action = "keep";
            }
            # Then remove the aggregation label
            {
              regex = "aggr_kind";
              action = "labeldrop";
            }

            # Drop {content,header,transfer}Size that don't have a content_type and/or content_origin
            # They're just totals, we can obtain them by summing the individual parts
            {
              source_labels = [ "__name__" "content_origin" "content_type" ];
              regex = "sitespeedio_pagexray_((content|header|transfer)Size|cookies|requests)(;;|;[^;]*;|;;[^;]*)";
              action = "drop";
            }
          ];
        }
      ];
      extraFlags = let prometheus = config.services.prometheus.package;
      in [
        # Custom consoles
        "--web.console.templates=${prometheus}/etc/prometheus/consoles"
        "--web.console.libraries=${prometheus}/etc/prometheus/console_libraries"
      ];
    };
    nginx.virtualHosts = {
      "metrics.joka00.dev" = {
        forceSSL = true;
        enableACME = true;
        locations."/".proxyPass =
          "http://localhost:${toString config.services.prometheus.port}";
      };
    };
  };
}
