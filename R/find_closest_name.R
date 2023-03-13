#' find_closet_name
#'
#' Cette fonction prend en entré une chaine de caractères et une liste
#' de chaines de caractères. Elle renvoie le ou les chaines de caractères
#' de la liste qui ont l'écriture la plus proche de la chaine caractère
#' seule. Ainsi elle peut-être utilisé dans le cadre de correction de saisie.
#' Pour trouver les mots qui se rapprochent le plus nous utlisons la
#' méthode de Levenshtein. Elle ne différencie pas les majuscules des
#' miniscules. Et ne renvoie qu'une fois une valeur répétée.
#'
#' @param list_name Liste de nom qui sera utilisée et confrontée à name
#' @param name Nom que l'on souhaite trouver dans la liste
#'
#' @return Elle retourne une vecteur de chaine de cacartère prenant ayant une
#' longueur de 1 à n où n est la taille de la liste donnée en entrée.
#' @importFrom stringdist stringdist
#' @examples
#' find_closest_name(list_name = arrets_tan$libelle,name = "Morr")
#' find_closest_name(list_name = arrets_tan$libelle,name = "Commerce")
#' @export
find_closest_name <- function(list_name, name){
  if (length(name) > 1){
    stop("Le nom ne doit contenir qu'une chaine de caractères.")}
  else {
  find <- stringdist(toupper(list_name), toupper(name), method = "lv")
  return(unique(list_name[which(find == min(find))]))
  }
}




