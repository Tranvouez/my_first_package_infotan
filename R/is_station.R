
#' La fonction is_station
#'
#' Cette fonction prend en entrée une chaine de caractère dans l'optique de
#' déterminer si elle correspond au nom d'un arrêt du réseau nantais.
#'
#' @param station Le nom de la station en toutes lettres
#' @return Elle renvoie un booléen qui permet de déterminer si la chaine
#' appartient "TRUE" ou non "FALSE" à la liste d'arrêt de la tan.
#' La fonction gére le problème de majuscule.
#' @examples
#' is_station("Bruneau")#TRUE
#' is_station("Tennis")#FALSE
#' is_station("bruneau")#TRUE
#' @export
is_station <- function(station){
  if (is.character(station)){
  return(toupper(station) %in% toupper(arrets_tan$libelle))
  }
  else
    warning("L'entrée n'est pas une chaine de caractères.")
}






