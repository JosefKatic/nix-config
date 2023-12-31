{ config, pkgs, ... }: {
  programs.firefox = {
    enable = true;
    package = pkgs.wrapFirefox pkgs.firefox-unwrapped {
      extraPolicies = {
        CaptivePortal = true;
        DisableFirefoxStudies = true;
        DisablePocket = true;
        DisableTelemetry = true;
        DisableFirefoxAccounts = false;
        NoDefaultBookmarks = true;
        OfferToSaveLogins = false;
        OfferToSaveLoginsDefault = false;
        PasswordManagerEnabled = false;
        FirefoxHome = {
            Search = true;
            Pocket = false;
            Snippets = false;
            TopSites = false;
            Highlights = false;
        };
        UserMessaging = {
            ExtensionRecommendations = false;
            SkipOnboarding = true;
        };
      };
    };
    profiles = {
      joka = {
          id = 0;
          name = "joka";
          extensions = with config.nur.repos.rycee.firefox-addons; [
              ublock-origin
              privacy-badger
              bitwarden
              clearurls
              decentraleyes
              duckduckgo-privacy-essentials
              floccus
              ghostery
              privacy-redirect
              privacy-badger
              languagetool
              disconnect
              react-devtools
          ];
          search = {
              force = true;
              default = "DuckDuckGo";
              engines = {
                  "Nix Packages" = {
                      urls = [{
                          template = "https://search.nixos.org/packages";
                          params = [
                              { name = "type"; value = "packages"; }
                              { name = "query"; value = "{searchTerms}"; }
                          ];
                      }];
                      icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
                      definedAliases = [ "@np" ];
                  };
                  "NixOS Wiki" = {
                      urls = [{ template = "https://nixos.wiki/index.php?search={searchTerms}"; }];
                      iconUpdateURL = "https://nixos.wiki/favicon.png";
                      updateInterval = 24 * 60 * 60 * 1000;
                      definedAliases = [ "@nw" ];
                  };
                  "Wikipedia (en)".metaData.alias = "@wiki";
                  "Google".metaData.hidden = true;
                  "Amazon.com".metaData.hidden = true;
                  "Bing".metaData.hidden = true;
                  "eBay".metaData.hidden = true;
              };
          };
          settings = {
              "general.smoothScroll" = true;
              "dom.security.https_only_mode" = true;
              "identity.fxaccounts.enabled" = false;
              "privacy.trackingprotection.enabled" = true;
          };
          extraConfig = ''
              user_pref("toolkit.legacyUserProfileCustomizations.stylesheets", true);
              user_pref("full-screen-api.ignore-widgets", true);
              user_pref("media.ffmpeg.vaapi.enabled", true);
              user_pref("media.rdd-vpx.enabled", true);
          '';
          userChrome = (import ./user-css.nix);
          userContent = ''
          # Here too
          '';
      };
    };
  };
  home = {
    sessionVariables.BROWSER = "firefox";
  };
  xdg.mimeApps.defaultApplications = {
    "text/html" = [ "firefox.desktop" ];
    "text/xml" = [ "firefox.desktop" ];
    "x-scheme-handler/http" = [ "firefox.desktop" ];
    "x-scheme-handler/https" = [ "firefox.desktop" ];
  };
}