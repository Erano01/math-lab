# latexmk ayarları. `latex/` dizininden `-cd` ile çalıştırın:
#   cd latex && latexmk -cd exams/dgs/main.tex
# (`just pdf` bunu sizin için yapar.)

use Cwd qw(abs_path);
use File::Basename qw(dirname);

# Bu dosyanın bulunduğu dizin = latex/ (mutlak yol; -cd sonrası da geçerli)
my $root   = dirname(abs_path(__FILE__));
my $shared = "$root/shared";

# latex/ kökü özyinelemesiz eklenir: \input{topics/...} her belgeden çalışır,
# ama TeX build/ klasörlerini ya da başka main.tex dosyalarını taramaz.
# ensure_path TeX'in varsayılan arama yollarını korur.
ensure_path('TEXINPUTS', "$root", "$shared//");
ensure_path('BIBINPUTS', "$shared//");
ensure_path('BSTINPUTS', "$shared//");

$pdf_mode = 1;        # pdflatex (LuaLaTeX için: $pdf_mode = 4;)
$out_dir  = 'build';  # her belgenin yanında build/ dizini
$bibtex_use = 2;      # .bbl dosyalarını gerektiğinde yeniden üret, clean'de sil

@default_files = ();  # argümansız çağrıda rastgele .tex derlemesin
$pdflatex = 'pdflatex -file-line-error -interaction=nonstopmode -halt-on-error %O %S';
$lualatex = 'lualatex -file-line-error -interaction=nonstopmode -halt-on-error %O %S';
