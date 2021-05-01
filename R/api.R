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

# as.character.centralperk <- function(x, ...) {
#   paste(c(x$quote, x$character), collapse = "\n~ ")
# }



single_character <- function(character) {
  ## retrieve all quotes from API
  allquotes <- friends_quotes_api("")$content

  ## set characters
  char_list <- map(allquotes, "character") %>% unlist()
  names(allquotes) <- char_list

  ## pick one random quote from index
  case_when(
    character == "Chandler" ~ {char_index_random <- 9},
    character == "Monica" ~ {char_index_random <- 3},
    TRUE ~ {
      ## find index of quotes from chosen character
      char_index <- which(names(allquotes) == character)
      char_index_random <- as.numeric(sample(char_index, 1) )
    }
  )

  ## retrieve quote and assign to class
  single_quote <- pluck(allquotes, char_index_random)
  structure(single_quote, class = "centralperk")
}


centralperk <- function() {
  structure(friends_quotes_api("random")$content, class = "centralperk")
}



ross <- function() {
  single_character("Ross")
}

rachel <- function() {
  single_character("Rachel")
}

monica <- function() {
  single_character("Monica")
}

joey <- function() {
  single_character("Joey")
}

phoebe <- function() {
  single_character("Phoebe")
}

chandler <- function() {
  single_character("Chandler")
}
