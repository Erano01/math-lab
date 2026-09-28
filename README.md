# math-lab

Matematik araştırma ve öğrenme notlarım: LaTeX notları/makaleleri ve Lean 4
formalizasyonları yan yana.

## Dizin yapısı

```
math-lab/
├── justfile                 # pdf / lean / all / clean
├── .github/workflows/       # latex.yml (PDF artifact), lean.yml
├── latex/
│   ├── .latexmkrc           # build/ çıktısı, TEXINPUTS -> shared/
│   ├── shared/              # preamble.sty, refs.bib
│   ├── notes/<konu>/main.tex
│   └── research/<proje>/main.tex
└── lean/                    # tek Lake projesi: MathLab (mathlib)
    ├── MathLab.lean         # tüm modülleri import eder
    └── MathLab/
        ├── LinearAlgebra/
        └── Research/
```

İleride `blueprint/` (leanblueprint) kök dizine eklenebilir; mevcut yapıyı
değiştirmek gerekmez.

## Gereksinimler (Arch Linux)

```sh
sudo pacman -S --needed just texlive-binextra texlive-latex texlive-latexrecommended \
  texlive-latexextra texlive-fontsrecommended texlive-langeuropean texlive-luatex
curl https://elan.lean-lang.org/elan-init.sh -sSf | sh   # elan + lake + lean
```

Editör: VS Code + `lean4` eklentisi, LaTeX için `LaTeX Workshop`.

## Derleme

```sh
just pdf     # tüm LaTeX belgeleri -> latex/**/build/main.pdf
just lean    # lake exe cache get && lake build
just all
just clean   # LaTeX ara dosyaları ve build/ dizinleri
```

> mathlib'i asla kaynaktan derlemeyin: `lake build` öncesi her zaman
> `lake exe cache get` çalıştırın (`just lean` bunu yapar).

Tek bir belge: `cd latex && latexmk -cd notes/linear-algebra/main.tex`
(`.latexmkrc` yalnızca `latex/` dizininden çalıştırılınca okunur.)

## Yeni LaTeX notu

1. `latex/notes/<konu>/main.tex` oluşturun (araştırma için `latex/research/<proje>/`).
2. Preamble'ı yükleyin — göreli yol gerekmez:
   ```latex
   \documentclass{article}
   \usepackage{preamble}            % İngilizce için: [english]
   ...
   \bibliographystyle{plain}
   \bibliography{refs}              % latex/shared/refs.bib
   ```
3. `just pdf`. Dosya adı `main.tex` olmalı; CI yalnızca bunları derler.

Ortamlar: `theorem`, `lemma`, `proposition`, `corollary`, `definition`,
`example`, `remark`, `proof`. Makrolar: `\N \Z \Q \R \C`, `\abs{}`, `\norm{}`,
`\inner{}`, `\rank`, `\tr`, `\Span`, `\Ker`, `\Img`. Referans için `\cref{}`.

## Yeni Lean modülü

1. Dosyayı ilgili namespace dizinine ekleyin, ör.
   `lean/MathLab/LinearAlgebra/Eigen.lean`:
   ```lean
   import Mathlib.LinearAlgebra.Eigenspace.Basic

   namespace MathLab.LinearAlgebra
   -- ...
   end MathLab.LinearAlgebra
   ```
2. `lean/MathLab.lean` içine `import MathLab.LinearAlgebra.Eigen` ekleyin.
3. `just lean`.

Yeni bir alan için `lean/MathLab/<Alan>/` dizini açıp aynı adımları izleyin.
mathlib'i güncellemek: `cd lean && lake update && lake exe cache get`.
