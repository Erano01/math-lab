# math-lab

Matematik notlarım ve araştırmalarım. LaTeX belgeleri `latex/`, Lean 4
formalizasyonları `lean/` altında.

LaTeX tarafında her belge kendi klasöründe `main.tex` olarak durur: notlar
`latex/notes/<konu>/`, araştırmalar `latex/research/<proje>/` altında. Ortak
preamble ve kaynakça `latex/shared/` içinde; belgeler bunları
`\usepackage{preamble}` ve `\bibliography{refs}` ile doğrudan kullanır.
Preamble varsayılan olarak Türkçedir, İngilizce için `[english]` seçeneği
verilir.

Lean tarafı mathlib'e bağlı tek bir Lake projesidir (`MathLab`). Modüller
konuya göre `lean/MathLab/<Alan>/` altına yazılır ve `lean/MathLab.lean`
dosyasından import edilir.

## Kurulum ve derleme

```sh
sudo pacman -S --needed just texlive-binextra texlive-latex texlive-latexrecommended \
  texlive-latexextra texlive-fontsrecommended texlive-langeuropean texlive-luatex
curl https://elan.lean-lang.org/elan-init.sh -sSf | sh
```

```sh
just pdf     # LaTeX belgelerini derler, çıktı her belgenin build/ klasörüne
just lean    # mathlib önbelleğini indirir ve Lean projesini derler
just all     # ikisi birden
just clean   # LaTeX ara dosyalarını ve build/ klasörlerini siler
```

Tek bir belgeyi derlemek için `latex/` içinden
`latexmk -cd notes/<konu>/main.tex` çalıştırılır; `.latexmkrc` yalnızca bu
dizinden okunur.

mathlib kaynaktan derlenmemeli, `lake build` öncesinde her zaman
`lake exe cache get` çalıştırılmalı (`just lean` bunu yapıyor). mathlib'i
güncellemek için `lake update && lake exe cache get`.
