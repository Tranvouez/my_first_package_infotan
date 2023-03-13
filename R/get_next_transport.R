#' get_next_transport
#'
#' Cette fonction permet de renvoyer les horaires de passages des lignes
#' de transport du réseau nantais. Il faut pour cela donner le nom
#' d'une station en entrée. Si le nom est incorect, la fonction renvoie
#' la où les stations qui ont le nom le plus proche au sens de Levenshtein.
#'
#' @param station Le paramètre station est une chaine de caractères.
#'
#' @return La fonction renvoie un data frame comportant le nom de la ligne,
#' son terminus et le temps d'attente pour l'arrêt spécifié.
#' @examples
#' get_next_transport("Commerce")
#' @export
get_next_transport <- function(station){
  nom <- find_closest_name(arrets_tan$libelle,station)
  for (i in 1:length(nom)){
    print(sprintf("Horaires de l'arrêt: %s",nom[i]))
    cat("\n")
    get_waiting_time(unique(arrets_tan$codeLieu[which(nom[i] == arrets_tan$libelle)]))
    cat("\n") #Saut de ligne
    }
}

