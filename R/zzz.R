.onAttach <- function(libname, pkgname) {
  netrc <- ifelse(.Platform$OS.type == "windows", "~/_netrc", "~/.netrc")

  if (!file.exists(netrc) &&
    !exists("labkey.sessionCookieName") &&
    !exists("apiKey", where = Rlabkey:::.lkdefaults) &&
    Sys.getenv("ISR_login") == "") {
    packageStartupMessage("A .netrc file is required to connect to ImmuneSpace. For more information on how to create one, refer to the Configuration section of the introduction vignette.")
  }
    msg <- sprintf(
        "Package '%s' is deprecated and will be removed from Bioconductor
         version %s", pkgname, "3.20")
    .Deprecated(msg=paste(strwrap(msg, exdent=2), collapse="\n"))
}
