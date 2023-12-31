% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/tracks.R
\name{epilogos_json}
\alias{epilogos_json}
\title{Generate epilogo json configuration file}
\usage{
epilogos_json(cat_df)
}
\arguments{
\item{cat_df}{Dataframe with 3 columns of categories, names and colors}
}
\value{
Directory
}
\description{
A convience function to generate epilogo json configuration file to be passed for \code{epi_logos()}
}
\details{
The only argument passed to this function is data.frame or data.frame similar object.
It should have 3 column: First is the state number of epilogos.
The second is the label of the state. Finally, the desired colored of such state.
Check the example provided for the structure of this data.frame.
}
\examples{
epilog_dir <- system.file("extdata", "epilog.qcat.bgz", package = "rGenomeTracks")
epi_cat <- data.frame(
  category = 1:15,
  label = c(
    "Active TSS",
    "Flanking Active TSS",
    "Transcr at gene 5 and 3",
    "Strong transcription",
    "Weak transcription",
    "Genic enhancers",
    "Enhancers",
    "ZNF genes & repeats",
    "Heterochromatin",
    "Bivalent/Poised TSS",
    "Flanking Bivalent TSS/Enh",
    "Bivalent Enhancer",
    "Repressed PolyComb",
    "Weak Repressed PolyComb",
    "Quiescent/Low"
  ),
  color = c(
    "#ff0000", "#ff4500", "#32cd32", "#008000",
    "#006400", "#c2e105", "#ffff00", "#66cdaa",
    "#8a91d0", "#cd5c5c", "#e9967a", "#bdb76b",
    "#808080", "#c0c0c0", "#ffffff"
  )
)
epilog <- track_epilogos(file = epilog_dir, categories_file = epilogos_json(epi_cat))
\dontrun{
plot_gtracks(epilog, chr = "X", start = 3100000, 3150000)
}
}
\author{
Omar Elashkar
}
\keyword{track_epilogos}
