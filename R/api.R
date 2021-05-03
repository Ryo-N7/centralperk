#' Main interface function to "Friends Quotes API"
#' @param path Parameter for API. Leave blank, any integer, or 'random'
#' @keywords internal
#' @importFrom httr modify_url user_agent GET content stop_for_status
#' @return list of class 'friends_quotes_api' with API response

friends_quotes_api <- function(path) {
  base_url <- "https://friends-quotes-api.herokuapp.com"

  if (path == "") {
    path <- "/quotes/"
  } else {
    path <- paste0("/quotes/", path)
  }

  set_url <- httr::modify_url(base_url, path = path)
  ua <- httr::user_agent("https://github.com/Ryo-N7/centralperk")

  resp <- httr::GET(set_url, ua)

  httr::stop_for_status(resp, task = "retrieve quote. Check your internet connection and try again later")

  structure(
    list(
      content = httr::content(resp),
      path = path,
      response = resp
    ),
    class = "friends_quotes_api"
  )
}

#' S3 print method for 'friends_quotes_api' class
#' @export

print.friends_quotes_api <- function(x, ...) {
  cat("<Friends-Quotes ", x$path, ">\n", sep = "")
  utils::str(x$content)
  invisible(x)
}

#' S3 print method for 'centralperk' class
#' @export

print.centralperk <- function(x, ...) {
  cat("\n",
      x$quote,
      "\n\n",
      paste(">", x$character))
}

#' Grab quote for a single character
#' @param character Name of main Friends character
#' @keywords internal
#' @importFrom purrr map pluck
#' @return list of class 'centralperk' with 2 elements: character and quote

single_character <- function(character) {
  ## retrieve all quotes from API
  allquotes <- friends_quotes_api("")$content

  ## set characters
  char_list <- unlist(purrr::map(allquotes, "character"))
  names(allquotes) <- char_list

  ## pick one random quote from index
  ## Monica and Chandler only have 1 each so hardcode that
  if (character == "Chandler") {
    char_index_random <- 9
  } else if (character == "Monica") {
    char_index_random <- 3
  } else {
    ## find index of quotes from chosen character
    char_index <- which(names(allquotes) == character)
    ## need to explicitly set to numeric of type error with integer
    char_index_random <- as.numeric(sample(char_index, 1))
  }

  ## retrieve quote and assign to class
  single_quote <- purrr::pluck(allquotes, char_index_random)
  structure(single_quote, class = "centralperk")
}

#' Get a random 'Friends' Quote
#' @return list of class 'centralperk' with 2 elements: character and quote
#' @export
#' @describeIn centralperk Random quote from a random main character from Friends
#' @examples
#' centralperk()

centralperk <- function() {
  structure(friends_quotes_api("random")$content, class = "centralperk")
}

#' @export
#' @describeIn centralperk A random quote from Ross
ross <- function() {
  single_character("Ross")
}

#' @export
#' @describeIn centralperk A random quote from Rachel
rachel <- function() {
  single_character("Rachel")
}

#' @export
#' @describeIn centralperk A random quote from Monica
monica <- function() {
  single_character("Monica")
}

#' @export
#' @describeIn centralperk A random quote from Joey
joey <- function() {
  single_character("Joey")
}

#' @export
#' @describeIn centralperk A random quote from Phoebe
phoebe <- function() {
  single_character("Phoebe")
}

#' @export
#' @describeIn centralperk A random quote from Chandler
chandler <- function() {
  single_character("Chandler")
}
