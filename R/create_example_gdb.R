#' Generate an example gdb.
#'
#' Generates an example gdb.
#' By default it will be stored in a temporary file which will be deleted at the end of the R session.
#' Alternatively, the `filepath` parameter can be set to store the gdb in a location of choice.
#'
#' @param filepath Filepath to write example gdb to.
#' By default, the gdb is stored as a temporary file, which will be deleted at the
#' end of the R session.
#' @return An object of class `gdb`: a connection to an RVAT gdb file.
#' @export
#' @examples
#' # generate example gdb
#' gdb <- create_example_gdb()
#'
create_example_gdb <- function(filepath = NULL) {

  # generate tempfile if no filepath is provided
  if (is.null(filepath)) {
    filepath <- tempfile()
  } else {
    # check if file already exists
    if (file.exists(filepath)) {
      stop(sprintf("%s already exists. Please delete or use a different filepath.", filepath))
    }
  }

  # example gdb
  gdb <- rvat_example("rvatData.gdb")

  # copy gdb to tmpfile
  if (!file.copy(gdb, filepath)) {
    stop("Failed to copy example gdb")
  }

  # return to gdb
  gdb(filepath)
}
