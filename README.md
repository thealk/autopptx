# gctriviar :question: :beers:
*A tiny package for automating the preparation of Western University Grad Club Trivia presentations*

## NB: THIS README IS OUT OF DATE

Given a spreadsheet containing the clever questions you plan to ask next time you host Trivia, this package will auto-populate a powerpoint presentation for you in the style of Grad Club Trivia.

### Inputs
- A spreadsheet (.xlsx) that contains at least two columns ("Question", "QuestionN")
- Powerpoint template ("GC_Trivia_Template.pptx"), which can be downloaded from this repo
- Name of the host (defaults to Thea)

### Output
- **trivia.pptx**: A powerpoint in the style of the provided template that contains one slide per question, a la Grad Club Trivia

### Dependencies:
- [`officer`](https://cran.r-project.org/web/packages/officer/) (for generating the powerpoint object)
- `readxl`
- `magrittr`

### Limitations, which future versions may or may not take care of
- The questions/question numbers must be in the **exact order you want them to appear on the spreadsheet.**
- The title slide and the intro slide to Round 1 are automatically generated, but Round 2 and Round 3 intro slides and Answer slides are **not**
- Text is input exactly as it appears in the Question column of the spreadsheet. This means the following types of questions will need to be **manually** edited:
  - Multiple choice
  - Multimedia (images, audio)
  
### Super handy resources for making this thing:
- [Generating powerpoints with `officer`](https://cran.r-project.org/web/packages/officer/vignettes/powerpoint.html)
- [Crafting a Powerpoint Presentation with R](http://lenkiefer.com/2017/09/23/crafting-a-powerpoint-presentation-with-r/)
- [Using purrr with officer](http://lenkiefer.com/2017/09/27/use-purrr/) (though NB didn't wind up going this route, still a very helpful tutorial)
- 


:wave: Hi Elizabeth.
