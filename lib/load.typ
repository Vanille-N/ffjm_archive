#let join-path(..dirs) = dirs.pos().join("/")

#let data-path = "../data/"

// Figure wrapper.
// - `dir`: give the path to the directory of the exercise.
// - `meta`: provide the parsed metadata from `meta.toml`.
// - `id`: figure identifier as it appears in `meta.toml`.
#let figure(id, dir: "", meta: (:)) = {
  let figs = meta.assets.figures
  let fig = figs.filter(f => f.id == id).at(0)

  if fig.type == "image" {
    image(join-path(dir, "assets", fig.fichier))
  } else if fig.type == "cetz" {
    import join-path(dir, "assets", fig.fichier): fig
    fig()
  }
}

// Load one exercise given its path.
// We return a dictionary that contains the metadata and the contents of the exercise.
#let load(root) = {
  let meta = toml(join-path(root, "meta.toml"))

  let fig = figure.with(dir: root, meta: meta)

  import join-path(root, "enonce.typ"): enonce
  import join-path(root, "solution.typ"): solution
  import join-path(root, "explication.typ"): explication
  (
    meta: meta,
    enonce: enonce(fig),
    solution: solution,
    explication: explication(fig),
  )
}
