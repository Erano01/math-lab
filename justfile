# math-lab görevleri. `just --list` ile hepsini görün.

# LaTeX belgelerini bulur (latex/ dizinine göre, build/ hariç)
tex_docs := "find notes research -name main.tex -not -path '*/build/*' -print0"

default:
    @just --list

# Tüm LaTeX belgelerini derle (latex/**/build/main.pdf)
pdf:
    cd latex && {{tex_docs}} | xargs -0 -r latexmk -cd

# mathlib önbelleğini indir ve Lean projesini derle
lean:
    cd lean && lake exe cache get
    cd lean && lake build

# Her şeyi derle
all: pdf lean

# LaTeX yardımcı dosyalarını ve build/ dizinlerini sil (.lake'e dokunmaz)
clean:
    cd latex && {{tex_docs}} | xargs -0 -r latexmk -cd -c
    find latex -type d -name build -prune -exec rm -rf {} +
