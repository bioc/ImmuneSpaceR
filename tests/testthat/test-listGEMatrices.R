context("listGEMatrices")

# Source depdencies -------------------------------------------
source("global_variable.R")
source("global_dependencies.R")
source("set_curlOptions.R")


# Variables --------------------------------------------------
em_list <- list()
em_list[["SDY269"]] <- c("LAIV_2008", "TIV_2008")
em_list[["SDY404"]] <- c("SDY404_PBMC_Young",
                         "SDY404_PBMC_Older")


# Helper Functions ---------------------------------------------
chk_mats <- function(sdy, exp_mat_names){
  con <- CreateConnection(sdy, verbose = TRUE)
  expect_true(!is.null(con$config$labkey.url.base))

  mats <- con$listGEMatrices()
  expect_true(all(exp_mat_names %in% mats$name))
}


# Tests --------------------------------------------------------
test_that("gets correct matrices for SDY269", {
  sdy <- "SDY269"
  chk_mats(sdy, em_list[[sdy]])
})

test_that("gets correct matrices for SDY404", {
  sdy <- "SDY404"
  chk_mats(sdy, em_list[[sdy]])
})


# cleanup ------------------------------------------------------
if(exists("netrc_file")){
  file.remove(netrc_file)
}