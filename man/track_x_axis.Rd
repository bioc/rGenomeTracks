% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/tracks.R
\name{track_x_axis}
\alias{track_x_axis}
\title{Specify x_axis option for genome_track.}
\usage{
track_x_axis(
  title = NULL,
  height = 2,
  overlay_previous = "no",
  where = "bottom",
  fontsize = 15
)
}
\arguments{
\item{title}{String. If specificed, the title of the track to be displayed.}

\item{height}{Numeric. The height of the plotted track in cm. Default is 2.
See notes.}

\item{overlay_previous}{String. Options are "no" (default) or "yes" or
"share-y".}

\item{where}{String. Either "bottom" (default) or "top"}

\item{fontsize}{Numeric value to font size of tracks's text.}
}
\value{
genome_track
}
\description{
This track will specifiy the options for x-axis for location,
height, font size and wheather to overlay previous track.
}
\note{
\code{fontsize} argument can be overriden by the same argument in \code{plot_gtracks()}
}
\examples{
tads_dir <- system.file("extdata", "tad_classification.bed",
  package = "rGenomeTracks"
)
tads <- track_domains(
  file = tads_dir, border_color = "black",
  color = "#11FF34", height = 5
)
tads_i <- track_domains(
  file = tads_dir, border_color = "red",
  color = "#cccccc", height = 3, orientation = "inverted"
)
tracks <- track_x_axis(where = "top") +
  tads + tads_i
\dontrun{
plot_gtracks(tracks, chr = "X", start = 30 * 10^5, end = 35 * 10^5)
}
}
\author{
Omar Elashkar
}
