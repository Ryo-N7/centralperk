friends_quotes_api <- function(path) {

  #path <- "random"

  base_url <- "https://friends-quotes-api.herokuapp.com"

  if (path != "quotes" & path != "") {
    path <- paste0("/quotes/", path)
  }

  if (path == "") {
    path <- "/quotes/"
  }

  set_url <- httr::modify_url(base_url, path = path)
  ua <- httr::user_agent("https://github.com/Ryo-N7/centralperk")


  resp <- httr::GET(set_url, ua)


  structure(
    list(
      content = httr::content(resp),
      path = path,
      response = resp
    ),
    class = "friends_quotes_api"
  )

}


print.friends_quotes_api <- function(x, ...) {
  cat("<Friends-Quotes ", x$path, ">\n", sep = "")
  utils::str(x$content)
  invisible(x)
}

print.centralperk <- function(x, ...) {
  cat("\n",
      x$quote,
      "\n\n",
      paste(">", x$character))
}



single_character <- function(character) {
  ## retrieve all quotes from API
  allquotes <- friends_quotes_api("")$content

  ## set characters
  char_list <- map(allquotes, "character") %>% unlist()
  names(allquotes) <- char_list

  ## find index of quotes from chosen character
  char_index <- which(names(allquotes) == character)

  ## pick one random quote from index
  char_index_random <- sample(char_index, 1)

  ## retrieve quote and assign to class
  single_quote <- pluck(allquotes, char_index_random)
  structure(single_quote, class = "centralperk")
}


centralperk <- function() {
  structure(friends_quotes_api("random")$content, class = "centralperk")
}


