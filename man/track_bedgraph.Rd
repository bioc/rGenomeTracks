% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/tracks.R
\name{track_bedgraph}
\alias{track_bedgraph}
\title{Generate bedgraph track}
\usage{
track_bedgraph(
  file,
  title = NULL,
  height = 2,
  overlay_previous = "no",
  orientation = NULL,
  color = "#1f78b4",
  alpha = 1,
  max_value = NULL,
  min_value = NULL,
  use_middle = FALSE,
  show_data_range = TRUE,
  type = "fill",
  negative_color = NULL,
  nans_to_zeros = FALSE,
  summary_method = NULL,
  number_of_bins = 700,
  transform = "no",
  log_pseudocount = 0,
  y_axis_values = "transformed",
  second_file = NULL,
  operation = "file",
  grid = FALSE,
  rasterize = FALSE
)
}
\arguments{
\item{file}{String. The location of the track file}

\item{title}{String. If specificed, the title of the track to be displayed.}

\item{height}{Numeric. The height of the plotted track in cm. Default is 2.
See notes.}

\item{overlay_previous}{String. Options are "no" (default) or "yes" or
"share-y".}

\item{orientation}{String. Default is NULL. Other option is "inverted".}

\item{color}{String. Hex color or string color. Default is "#1f78b4".}

\item{alpha}{Numeric variable between 0 and 1 to indicate level of transparancy.
Default is 1.}

\item{max_value}{Numeric. Default is NULL. The max value cut-off for the
numeric column.}

\item{min_value}{Numeric. Default is NULL. The max value cut-off for the
numeric column.}

\item{use_middle}{Boolean. Default is FALSE.}

\item{show_data_range}{Boolean. Default is TRUE.}

\item{type}{String. Options are "fill" (default),"line", "points".}

\item{negative_color}{Hex color or string to indicate color of negative values. Default is NULL.}

\item{nans_to_zeros}{Boolean. To convert empty values to zeros,
set this to TRUE. Default is FALSE.}

\item{summary_method}{String. summary_method applied over bin range.
This parameter is set to NULL. See details for options.}

\item{number_of_bins}{Numeric value to indicate summary method used over the bin range. Default is 700}

\item{transform}{String to indicate type of transformation applied.
Default is "no".}

\item{log_pseudocount}{Numeric. Default is 0.}

\item{y_axis_values}{String with two options "transformed" (default) or "original".}

\item{second_file}{Path for another file to be included in operations.
This parameter is not set by default.}

\item{operation}{Default is set to "file". See details.}

\item{grid}{Boolean. Default is FALSE.}

\item{rasterize}{Boolean. Default is FALSE.}
}
\value{
genome_track
}
\description{
Generate genome_track object from bedgraph files.
}
\details{
summary_method parameter can be choosen to be by "mean", "average", "max",
"min", "stdev", "dev", "coverage", "cov" or "sum".
Tranform paramter options are "no" (default) or "log", "log1p", "-log", "log2" or "log10".
'log1p': transformed_values = log(1 + initial_values)
'log': transformed_values = log(log_pseudocount + initial_values)
'log2': transformed_values = log2(log_pseudocount + initial_values)
'log10': transformed_values = log10(log_pseudocount + initial_values)
'-log': transformed_values = log(log_pseudocount + initial_values)
To compute operations on the fly on the file or between 2 bedgraph files,
you can tweak operation parameter, it should contains file or
file and second_file. It is adviced to use \code{nans_to_zeros = TRUE} to
avoid unexpected results. Example value for operation are "0.89 * file",
"- file", "file - second_file", "log2((1 + file) / (1 + second_file))" and
"max(file, second_file)"

to add the preferred line width or point size : type = "line:lw" where lw (linewidth) is numeric value.
Like \code{type = "line:0.5"} and \code{type = "points:0.5"}

By default the bedgraph is plotted at the base pair resolution.
This can lead to very large pdf/svg files. If plotting large regions.
If you want to decrase the size of your file.
You can either rasterize the bedgraph profile by using: \code{rasterize = TRUE}
}
\note{
\code{fontsize} parameter can be overriden by the same argument in \code{plot_gtracks()}
\code{height} parameter will be ignored if \code{overlay_previous} is set.
}
\examples{
bg_dir <- system.file("extdata", "GSM3182416_E12DHL_WT_Hoxd11vp.bedgraph.gz",
  package = "rGenomeTracks"
)
bed_genes_dir <- system.file("extdata", "HoxD_cluster_regulatory_regions_mm10.bed",
  package = "rGenomeTracks"
)

bg <- track_bedgraph(bg_dir, color = "green", height = 5, max_value = 10)
bg_middle <- track_bedgraph(bg_dir,
  use_middle = TRUE, color = "blue",
  height = 5, max_value = 10
)
bed_genes <- track_bed(bed_genes_dir,
  title = "Regulatory regions", ,
  color = "red", height = 3
)

tracks <- track_x_axis(where = "top") + bg + bg_middle + bed_genes
\dontrun{
plot_gtracks(tracks,
  chr = 2, start = 738 * 10^5, end = 750 * 10^5,
  trackLabelFraction = 0.2
)
}
}
\author{
Omar Elashkar
}
