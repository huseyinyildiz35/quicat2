

my_packages = c("shiny", "shinydashboard","readxl","shinythemes","catR","shinyBS","shinyjs","dplyr","shinydashboardPlus","ggplot2","DBI","dbplyr","RMySQL","writexl","shinyalert","shinyhelper")

my_packages = c("package_name_1", "package_name_2", ...)

install_if_missing = function(p) {
  if (p %in% rownames(installed.packages()) == FALSE) {
    install.packages(p, clean=TRUE, quiet=TRUE)
  }
}

invisible(sapply(my_packages, install_if_missing))
