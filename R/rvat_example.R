#' Get path(s) to rvat example data
#'
#' This function retrieves the file paths of example data, including an example vcf-file
#' and gdb.
#'
#' @param path Name of file. If `NULL`, the example files will be listed.
#' @export
#' @examples
#' rvat_example()
#' rvat_example("rvatData.gdb")
#' rvat_example("rvatData.vcf.gz")
rvat_example <- function(path = NULL) {
  if (is.null(path)) {
    dir(system.file("extdata", package = "rvatData"))
  } else {
    system.file("extdata", path, package = "rvatData", mustWork = TRUE)
  }
}
