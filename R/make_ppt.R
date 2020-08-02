#' Populate Powerpoint Function
#'
#' This function takes an ordered spreadsheet of trivia questions (gct) OR a list of sentences (lc) and the type of project (gct or lc) and populates a presentation.
#' @param type Type of project. Defaults to lc (LOUD Crowd) template.
#' @param questions An xlsx spreadsheet with at least two columns: Question and QuestionN OR a txt file with the first row labelled Question (TODO: fix)
#' @import officer
#' @import magrittr
#' @import readxl
#' @export

# # Make powerpoint
# library(officer)
# library(tidyverse)
# library(readxl)

# # Test
# questions <- "test.xlsx"
# template <- "GC_Trivia_Template2.pptx"
# name <- "Thea"
# ext = "xlsx", "txt"
# type = "gct", "lc"

make_ppt <- function(questions, type="gct"){

  if(type=="gct"){ # type = Grad Club Trivia
    master = "GCTrivia"
    ext = "xlsx"
    template="GC_Trivia_Template.pptx"
    name="Thea"
    header="Question"
    output = "trivia.pptx"
  } else if(type=="lc"){ # type = LOUD CROWD
    m = "LC"
    ext = "txt"
    template="LC_Readings_Template.pptx"
    #template="GC_Trivia_Template.pptx"
    name="The LOUD Crowd"
    header="Item"
    output = "lc_reading.pptx"
  }

  if(ext == "xlsx"){
    qs <- readxl::read_xlsx(questions)
  } else if(ext == "txt"){
      qs <- read.delim(questions)
    }


  tmp <- officer::read_pptx(template) %>%
    add_slide(layout = "Title Slide", master = "LC") %>% #, master = master
    ph_with(paste0("With ", name),
            location = ph_location(left = 6.5, top = 3))# %>%
    #add_slide(layout = "R1", master = "GCTrivia")

  for(n in 1:length(qs$Question)){
    if(type=="gct"){
      tmp <- make_slide(qs$Question[n], qs$QuestionN[n], tmp, m)
    }else if(type=="lc"){
      tmp <- make_slide(qs$Question[n], "", tmp, m)
    }
  }
  print(tmp, target = output) %>% invisible()
}
