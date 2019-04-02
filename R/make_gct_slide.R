#' Make Grad Club Trivia slide
#'
#' @param q Vector containing questions
#' @param qn Vector containing question numbers
#' @param pres Powerpoint object on which to add slides
#'
#' @return
#' @export
#'
#' @examples

make_gct_slide <- function(q, qn, pres){
  pres <- pres %>%
    add_slide(layout = "Title and Content", master = "GCTrivia") %>%
    ph_with(q,
            #location = ph_location(width = 4, height = 3))
            #location = ph_location_type(type = "body"))
            #location = ph_location_fullsize())
            location = ph_location(left = 1, top = 2, width = 12)) %>%
    ph_with(qn,
            location = ph_location(left = 0.5, top = 0.5, height = 1))
}
