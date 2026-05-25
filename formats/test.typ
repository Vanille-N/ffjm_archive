#import "/lib/lib.typ": load

// MISE EN PAGE ----------------
#set page("a4", margin: 2cm)
#set text(lang: "fr")
#set par(justify: true)

#let join(arr) = arr.join(", ")

// Give the exercise in the command line as e.g.,
//   --input ex=2025/QF/ex01
#let exid = sys.inputs.at("ex", default: none)
// Or if you're on the Typst app:
// #let exid = "2025/QF/ex01"

#let document(exid) = [
  #let ex = load.load("../data/" + exid)

  // EN-TÊTE ----------------
  #block[
    *Source :* #upper(ex.meta.info.concours)
    édition #ex.meta.info.edition — #ex.meta.info.annee
    — #ex.meta.info.etape
    — Exercice #ex.meta.exercice.numero (#ex.meta.info.categorie)
  ]

  #v(1em)

  //  CONTENU ----------------
  = #ex.meta.exercice.nom

  #ex.enonce

  #v(1em)

  == Réponse

  #ex.solution

  #v(1em)

  == Explication

  #ex.explication

  #v(1.5em)

  // TAGS ----------------
  #block[
  == Tags
    Thème(s) : #join(ex.meta.tags.themes) \
    Notion(s) : #join(ex.meta.tags.notions) \
    Technique(s) : #join(ex.meta.tags.techniques) \
    Niveau : #join(ex.meta.tags.niveau)
  ]
]

#{
  if exid != none {
    document(exid)
  } else {
    text(fill: red)[No exercise specified. Provide a `--input ex=...` on the command line.]
    
  }
}
