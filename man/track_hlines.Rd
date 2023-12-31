% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/tracks.R
\name{track_hlines}
\alias{track_hlines}
\title{Generate a track with horizontal lines}
\usage{
track_hlines(
  y_values,
  title = NULL,
  height = 0.5,
  overlay_previous = NULL,
  orientation = NULL,
  line_width = 0.5,
  line_style = "solid",
  color = "black",
  alpha = 1,
  max_value = NULL,
  min_value = NULL,
  show_data_range = TRUE
)
}
\arguments{
\item{y_values}{String for y-values where horizontal lines should be plotted separated by comma.}

\item{title}{String. If specificed, the title of the track to be displayed.}

\item{height}{Numeric. The height of the plotted track in cm. Default is 2.
See notes.}

\item{overlay_previous}{String. Options are "no" (default) or "yes" or
"share-y".}

\item{orientation}{String. Default is NULL. Other option is "inverted".}

\item{line_width}{Numeric value for line width.}

\item{line_style}{String with options of either "solid", "dashed", "dotted", and "dashdot".}

\item{color}{String. Hex color or string color. Default is "#1f78b4".}

\item{alpha}{Numeric variable between 0 and 1 to indicate level of transparancy.
Default is 1.}

\item{max_value}{Numeric. Default is NULL. The max value cut-off for the
numeric column.}

\item{min_value}{Numeric. Default is NULL. The max value cut-off for the
numeric column.}

\item{show_data_range}{Boolean. Default is TRUE.}
}
\value{
genome_track
}
\description{
\code{track_hlines()} creates a genome_track with horizonal lines that
can be overlayed on the previous track or, by default, track the lines in separate track.
}
\details{
y_values argument specify locations on the genome where where
horizontal lines should be plotted separated by comma, like "50, 90"
}
\examples{
bw_dir <- system.file("extdata", "bigwig2_X_2.5e6_3.5e6.bw",
  package = "rGenomeTracks"
)
mean_bw <- track_bigwig(
  file = bw_dir, color = "gray",
  type = "point:1", summary_method = "mean", number_of_bins = 300, max_value = 200, min_value = -5
)
min_bw <- track_bigwig(
  file = bw_dir, color = "blue", type = "line:1", summary_method = "min", number_of_bins = 300,
  overlay_previous = "share-y", show_data_range = FALSE,
  max_value = 200, min_value = -5
)
max_bw <- track_bigwig(
  file = bw_dir, color = "red", type = "line:1", summary_method = "max", number_of_bins = 300,
  overlay_previous = "share-y", show_data_range = FALSE,
  max_value = 200, min_value = -5
)
hlines <- track_hlines(
  y_values = "10, 150",
  overlay_previous = "share-y",
  color = "blue", line_style = "dotted"
)
\dontrun{
plot_gtracks(mean_bw + min_bw + max_bw + hlines, chr = "X", start = 27 * 10^5, end = 31 * 10^5)
}
}
\author{
Omar Elashkar
}
