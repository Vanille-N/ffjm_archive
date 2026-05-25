// Mode: Un style de mise en page.
//   "test": affiche l'énoncé et la réponse pour vérifier que c'est correctement rédigé.
#let mode = "test"

#import "formats/" + mode + ".typ": document

#{if mode == "test" {
  // Pour le mode "test", on affiche un exercice d'identifiant `exid`.
  // A priori sous la forme '{annee}/{epreuve}/ex{numero}'.
  // Il faut que 'data/{exid}/meta.toml' soit le chemin des métadonnées.
  let exid = "2025/QF/ex01"

  document(exid)
}}
