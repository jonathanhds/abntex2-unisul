# utilizado por IDEs externas para recompilarem os glossarios

#$out_dir = 'tmp';
#$aux_fir = 'tmp';

# file extensions to remove when cleaning
$clean_ext = 'abb.acn abb.acr abb.alg acn acr alg glo gls glg slo sls slg ist bbl';

$cleanup_includes_cusdep_generated = 1;
$cleanup_includes_generated = 1;

# make latexmk run makeglossaries automatically
add_cus_dep('glo', 'gls', 0, 'makeglo2gls');
add_cus_dep('acn', 'acr', 0, 'makeglo2gls');
sub makeglo2gls {
  my ($base_name, $path) = fileparse( $_[0] );
  pushd($path);
  system("makeglossaries $base_name");
  popd;
}