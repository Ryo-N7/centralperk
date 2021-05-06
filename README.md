
<!-- README.md is generated from README.Rmd. Please edit that file -->

<center>

<img src="https://i.imgur.com/zhTAyaZ.jpg" style="display: block; margin: auto;" width = "450" />

</center>

# centralperk

<!-- badges: start -->

[![License:
MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
<!-- badges: end -->

R client for [Melanie Seltzer](https://github.com/melanieseltzer)’s
[“friends-quotes-api”](https://friends-quotes-api.herokuapp.com/).
Inspired by [{goodshirt}](https://github.com/adam-gruer/goodshirt) by
[Adam Gruer](https://github.com/adam-gruer).

<center>

<img src="https://i.imgur.com/X7W62AE.gif" style="display: block; margin: auto;" width = "450" />

</center>

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
#>  Pivot! Pivot! Pivot! Pivot! Pivot! 
#> 
#>  > Ross
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
#>  Yeah, that's right. I stepped up! She's my friend and she needed help. And if I have to I'd pee on any one of you. 
#> 
#>  > Joey

rachel()
#> 
#>  Just so you know, it's not that common, it doesn't happen to every guy, and it is a big deal! 
#> 
#>  > Rachel

phoebe()
#> 
#>  Phoebe. That's P, as in Phoebe, H as in hoebe, O as in oebe, E as in ebe, B as in bebe, and E as in 'Ello there mate. 
#> 
#>  > Phoebe

ross()
#> 
#>  Unagi. 
#> 
#>  > Ross

chandler()
#> 
#>  I'm not so good with the advice. Can I interest you in a sarcastic comment? 
#> 
#>  > Chandler
```
