% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/utils-upload.R
\name{gcs_to_ee_table}
\alias{gcs_to_ee_table}
\title{Move a zipped shapefile from GCS to their EE Assets}
\usage{
gcs_to_ee_table(
  manifest,
  command_line_tool_path = NULL,
  overwrite = FALSE,
  quiet = FALSE
)
}
\arguments{
\item{manifest}{Character. manifest upload file. See \code{\link{ee_utils_create_manifest_table}}.}

\item{command_line_tool_path}{Character. Path to the Earth Engine command line
tool (CLT). If NULL, rgee assumes that CLT is set in the system PATH.
(ignore if \code{via} is not defined as "gcs_to_asset").}

\item{overwrite}{Logical. If TRUE, the assetId will be overwritten if
it exists.}

\item{quiet}{Logical. Suppress info message.}
}
\value{
Character. The Earth Engine asset ID.
}
\description{
Move a zipped shapefile from GCS to their EE Assets
}
\examples{
\dontrun{
library(rgee)
library(sf)
ee_Initialize(gcs = TRUE)

# 1. Read dataset and create a output filename
x <- st_read(system.file("shape/nc.shp", package = "sf"))
assetId <- sprintf("\%s/\%s", ee_get_assethome(), 'toy_poly_gcs')

# 2. From sf to .shp
shp_dir <- sprintf("\%s.shp", tempfile())
geozip_dir <- ee_utils_shp_to_zip(x, shp_dir)

# # 3. From local to gcs
# gcs_filename <- local_to_gcs(
#   x = geozip_dir,
#   bucket = "rgee_dev" # Insert your own bucket here!
# )
#
# # 4. Create Table Manifest
# manifest <- ee_utils_create_manifest_table(
#   gs_uri = gcs_filename,
#   assetId = assetId
# )
#
# # 5. From GCS to Earth Engine
# ee_nc <- gcs_to_ee_table(manifest, overwrite = TRUE)
# ee_monitoring()
# Map$addLayer(ee$FeatureCollection(ee_nc))
}
}
