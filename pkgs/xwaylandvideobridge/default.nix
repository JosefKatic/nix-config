{ stdenv
, fetchFromGitLab
, cmake
, pkg-config
, extra-cmake-modules
, qt5
, libsForQt5
}: stdenv.mkDerivation rec {
  pname = "xwaylandvideobridge";
  version = "unstable-2023-08-01";

  src = fetchFromGitLab {
    domain = "invent.kde.org";
    owner = "system";
    repo = "xwaylandvideobridge";
    rev = "d8069d87faa6e2b98e17800ef13e595d7d7711bc";
    sha256 = "08mgjjalybvfksy3lk4b488r56mhnmjgzpr7yghvss1lq4s7s3ic";
  };

  nativeBuildInputs = [
    cmake
    extra-cmake-modules
    pkg-config
  ];

 buildInputs = [
    qt5.qtbase
    qt5.qtquickcontrols2
    qt5.qtx11extras
    qt5.wrapQtAppsHook
    libsForQt5.kdelibs4support
    (libsForQt5.kpipewire.overrideAttrs (oldAttrs: {
      version = "unstable-2023-05-23";

      src = fetchFromGitLab {
        domain = "invent.kde.org";
        owner = "plasma";
        repo = "kpipewire";
        rev = "600505677474a513be4ea8cdc8586f666be7626d";
        hash = "sha256-ME/9xOyRvvPDiYB1SkJLMk4vtarlIgYdlereBrYTcL4=";
      };
    }))
  ];

  
}