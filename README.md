
<!-- README.md is generated from README.Rmd. Please edit that file -->

<img src="https://i.imgur.com/zhTAyaZ.jpg" style="display: block; margin: auto;" width = "450" />

# centralperk

<!-- badges: start -->

<!-- badges: end -->

R client for [Melanie Seltzer](https://github.com/melanieseltzer)’s
[“friends-quotes-api”](https://friends-quotes-api.herokuapp.com/).
Inspired by [{goodshirt}](https://github.com/adam-gruer/goodshirt) by
[Adam Gruer](https://github.com/adam-gruer).

## Installation

You can install the latest version of {centralperk} from Github with:

``` r
devtools::install_github("Ryo-N7/centralperk")
```

## Example

Random quote:

``` r
library(centralperk)

centralperk()
#> 
#>  Look at me! I'm Chandler! Could I be wearing any more clothes?! 
#> 
#>  > Joey
```

Each main character:

``` r
monica()
#> 
#>  Guys can fake it? Unbelievable! The one thing that’s ours! 
#> 
#>  > Monica

joey()
#> 
#>  How you doin? 
#> 
#>  > Joey

rachel()
#> 
#>  Just so you know, it's not that common, it doesn't happen to every guy, and it is a big deal! 
#> 
#>  > Rachel

phoebe()
#> 
#>  This is brand-new information! 
#> 
#>  > Phoebe

ross()
#> 
#>  I grew up in a house with Monica, okay. If you didn't eat fast, you didn't eat. 
#> 
#>  > Ross

chandler()
#> 
#>  I'm not so good with the advice. Can I interest you in a sarcastic comment? 
#> 
#>  > Chandler
```
