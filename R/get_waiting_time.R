#' get_waiting_time : obtenir le temps d'attente.
#'
#' Cette fonction prend en entrée le code_lieu d'un arrêt et renvoie le temps d'attente
#' des différentes lignes de transports à cet arrêt. Le terminus des lignes est précisé
#' pour nous indiquer dans quel sens va la ligne.
#'
#' @param code_lieu Le paramétre code lieu prend en compte le code de l'arrêt.
#'
#' @return La fonction affiche un dataframe de trois colonnes: numéro de la ligne, terminus et temps d'attente.
#' @importFrom jsonlite fromJSON
#' @source <https://open.tan.fr/ewp/tempsattente.json/CODELIEU>
#' @examples
#' get_waiting_time("AMER") #renvoie les temps d'attentes à l'arrêt américain.
#' @export
get_waiting_time <- function(code_lieu) {
  #code_lieu <- toupper(code_lieu)
  #Récupération de la base de données en ligne
  df <- jsonlite::fromJSON(sprintf("https://open.tan.fr/ewp/tempsattente.json/%s", code_lieu))[, c(7, 2, 4)]
  #Récuppération de la colonne des numéros de lignes.
  df[, 1] <- df[, 1][[1]]
  print(df)
}







