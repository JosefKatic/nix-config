''
  /* Hide Personalize new tab */
  @-moz-document url("about:home"),url("about:newtab"),url("about:blank") {
    .personalize-button {
      display: none !important;
    }
  }

  /* Highlight color inside browser content window */
  ::selection {
    background-color: dodgerblue !important;
    color: white !important;
  }
''
