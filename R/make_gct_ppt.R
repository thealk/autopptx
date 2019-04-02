#' Populate Grad Club Trivia Powerpoint Function
#'
#' This function takes an ordered spreadsheet of trivia questions, the GC powerpoint template, and populates a presentation with questions.
#' @param template The powerpoint template. Defaults to GCTrivia template (includes cover slide, font, and color scheme)
#' @param questions An xlsx spreadsheet with at least two columns: Question and QuestionN
#'
#' @return
#' @export
#'
#' @examples

# # Make powerpoint
# library(officer)
# library(tidyverse)
# library(readxl)

# # Test
# questions <- "test.xlsx"
# template <- "GC_Trivia_Template2.pptx"
# name <- "Thea"

make_gct_ppt <- function(questions, template, name="Thea"){
  qs <- readxl::read_xlsx(questions)
  tmp <- officer::read_pptx(template) %>%
    add_slide(layout = "Title Slide", master = "GCTrivia") %>%
    ph_with(paste0("With ", name),
            location = ph_location(left = 6.5, top = 3)) %>%
    add_slide(layout = "R1", master = "GCTrivia")

  for(n in 1:length(qs$Question)){
    tmp <- make_gct_slide(qs$Question[n], qs$QuestionN[n], tmp)
  }
  print(tmp, target = "test2.pptx") %>% invisible()
}
