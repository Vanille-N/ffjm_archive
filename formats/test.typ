#import "/lib/lib.typ": load

// MISE EN PAGE ----------------
#set page(width: 210mm, height: 297mm, margin: 2cm)
#set text(lang: "fr")
#set par(justify: true)

#let join(arr) = arr.join(", ")

// Give the exercise in the command line as e.g.,
//   --input ex=2025/QF/ex01
#let exid = sys.inputs.ex
// Or if you're on the Typst app:
// #let exid = "2025/QF/ex01"
#let ex = load.load("../data/" + exid)

// EN-TÊTE ----------------
#block[
  *Source :* #upper(ex.meta.meta.concours) 
  édition #ex.meta.meta.edition — #ex.meta.meta.annee 
   — #ex.meta.meta.etape
   — Exercice #ex.meta.exercice.numero (#ex.meta.meta.categorie)
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
//  Compétences : #join(meta.tags.competences) \
  Niveau : #join(ex.meta.tags.niveau)
]
