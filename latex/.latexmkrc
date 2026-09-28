# latexmk ayarları. `latex/` dizininden `-cd` ile çalıştırın:
#   cd latex && latexmk -cd notes/<konu>/main.tex
# (`just pdf` bunu sizin için yapar.)

use Cwd qw(abs_path);
use File::Basename qw(dirname);

# Bu dosyanın bulunduğu dizin -> latex/shared (mutlak yol; -cd sonrası da geçerli)
my $shared = dirname(abs_path(__FILE__)) . '/shared';

# Sondaki boş eleman (//:) TeX'in varsayılan arama yollarını korur.
ensure_path('TEXINPUTS', "$shared//");
ensure_path('BIBINPUTS', "$shared//");
ensure_path('BSTINPUTS', "$shared//");

$pdf_mode = 1;        # pdflatex (LuaLaTeX için: $pdf_mode = 4;)
$out_dir  = 'build';  # her belgenin yanında build/ dizini
$bibtex_use = 2;      # .bbl dosyalarını gerektiğinde yeniden üret, clean'de sil

@default_files = ();  # argümansız çağrıda rastgele .tex derlemesin
$pdflatex = 'pdflatex -file-line-error -interaction=nonstopmode -halt-on-error %O %S';
$lualatex = 'lualatex -file-line-error -interaction=nonstopmode -halt-on-error %O %S';
